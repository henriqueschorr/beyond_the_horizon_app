import 'package:flutter/material.dart';

/// Inherited scope propagating film grain / noise configuration through the widget hierarchy.
class GrainConfiguration extends InheritedWidget {
  final bool enabled;

  const GrainConfiguration({
    super.key,
    required this.enabled,
    required super.child,
  });

  static bool isEnabled(BuildContext context) {
    final config = context.dependOnInheritedWidgetOfExactType<GrainConfiguration>();
    return config?.enabled ?? true;
  }

  @override
  bool updateShouldNotify(GrainConfiguration oldWidget) => enabled != oldWidget.enabled;
}

/// Brutalist cyber-typography analog film grain texture surface.
/// Uses a continuous hardware-accelerated seamless repeating 256x256 Gaussian
/// noise texture asset (assets/textures/noise.png) inspired by SL24 Brutalism.
/// Eliminates CPU-bound vector point loops to achieve a locked 60/120 FPS
/// with true analog film grain and photocopier toner depth.
class GrainSurface extends StatelessWidget {
  final Widget? child;
  final Color? tintColor;
  final double intensity;
  final bool isForeground;
  final bool? enabled;

  const GrainSurface({
    super.key,
    this.child,
    this.tintColor,
    this.intensity = 1.0,
    this.isForeground = true,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    final isLocallyEnabled = enabled ?? GrainConfiguration.isEnabled(context);

    if (!isLocallyEnabled || intensity <= 0.0) {
      final safeChild = child ?? const SizedBox.shrink();
      return GrainConfiguration(
        enabled: false,
        child: safeChild,
      );
    }

    final noiseWidget = IgnorePointer(
      child: Opacity(
        opacity: (0.16 * intensity).clamp(0.0, 1.0),
        child: Image.asset(
          'assets/textures/noise.png',
          repeat: ImageRepeat.repeat,
          color: tintColor,
          colorBlendMode: tintColor != null ? BlendMode.srcATop : null,
          filterQuality: FilterQuality.low,
          alignment: Alignment.topLeft,
        ),
      ),
    );

    if (child == null) {
      return noiseWidget;
    }

    return GrainConfiguration(
      enabled: isLocallyEnabled,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          if (!isForeground) Positioned.fill(child: noiseWidget),
          child!,
          if (isForeground) Positioned.fill(child: noiseWidget),
        ],
      ),
    );
  }
}
