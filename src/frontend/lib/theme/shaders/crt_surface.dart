import 'package:flutter/material.dart';

/// Cathode-ray tube monitor surface shader codified in SDD 04 Section 2.2.
/// Features horizontal scanlines at 4.0px spacing, phosphor luminescence, and perimeter vignette.
class CrtSurface extends StatelessWidget {
  final Widget? child;
  final bool enabled;
  final double scanlineAlpha;

  const CrtSurface({
    super.key,
    this.child,
    this.enabled = true,
    this.scanlineAlpha = 0.18,
  });

  @override
  Widget build(BuildContext context) {
    if (!enabled) {
      return child ?? const SizedBox.shrink();
    }

    return RepaintBoundary(
      child: CustomPaint(
        foregroundPainter: _CrtSurfacePainter(scanlineAlpha: scanlineAlpha),
        child: child,
      ),
    );
  }
}

class _CrtSurfacePainter extends CustomPainter {
  final double scanlineAlpha;

  const _CrtSurfacePainter({required this.scanlineAlpha});

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    // 1. Horizontal scanlines at 4.0px spacing
    final scanlinePaint = Paint()
      ..color = Colors.black.withValues(alpha: scanlineAlpha)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    for (double y = 0; y < size.height; y += 4.0) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), scanlinePaint);
    }

    // 2. Curved perimeter glass vignette darkening edges and corners
    final vignettePaint = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 1.15,
        colors: [
          Colors.transparent,
          Colors.black.withValues(alpha: 0.45),
        ],
        stops: const [0.70, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), vignettePaint);
  }

  @override
  bool shouldRepaint(covariant _CrtSurfacePainter oldDelegate) {
    return oldDelegate.scanlineAlpha != scanlineAlpha;
  }
}
