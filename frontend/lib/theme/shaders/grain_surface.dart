import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

/// Procedural analog risograph and photocopier toner stipple painter codified in SDD 04 Section 2.2 & 5.1.
/// Renders 120 deterministic micro-stipple points at fixed seed 64.
class GrainSurface extends StatelessWidget {
  final Widget? child;
  final Color? tintColor;
  final double intensity;

  const GrainSurface({
    super.key,
    this.child,
    this.tintColor,
    this.intensity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        painter: _GrainSurfacePainter(
          tintColor: tintColor,
          intensity: intensity,
        ),
        child: child,
      ),
    );
  }
}

class _GrainPoint {
  final double xRatio;
  final double yRatio;
  final bool isDark;

  const _GrainPoint({
    required this.xRatio,
    required this.yRatio,
    required this.isDark,
  });
}

class _GrainSurfacePainter extends CustomPainter {
  static const int _pointCount = 120;
  static const int _seed = 64;

  final Color? tintColor;
  final double intensity;

  static final List<_GrainPoint> _cachedPoints = _generatePoints();

  const _GrainSurfacePainter({
    this.tintColor,
    this.intensity = 1.0,
  });

  static List<_GrainPoint> _generatePoints() {
    final random = Random(_seed);
    final list = <_GrainPoint>[];
    for (int i = 0; i < _pointCount; i++) {
      final x = random.nextDouble();
      final y = random.nextDouble();
      final isDark = random.nextDouble() < 0.45;
      list.add(_GrainPoint(xRatio: x, yRatio: y, isDark: isDark));
    }
    return list;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    final lightColor = tintColor ?? const Color(0xFFF5F3ED);
    final lightPaint = Paint()
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.square
      ..color = lightColor.withValues(alpha: (0.045 * intensity).clamp(0.0, 1.0));

    final darkPaint = Paint()
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.square
      ..color = const Color(0xFF000000).withValues(alpha: (0.12 * intensity).clamp(0.0, 1.0));

    final lightOffsets = <Offset>[];
    final darkOffsets = <Offset>[];

    for (final pt in _cachedPoints) {
      final offset = Offset(pt.xRatio * size.width, pt.yRatio * size.height);
      if (pt.isDark) {
        darkOffsets.add(offset);
      } else {
        lightOffsets.add(offset);
      }
    }

    if (darkOffsets.isNotEmpty) {
      canvas.drawPoints(PointMode.points, darkOffsets, darkPaint);
    }
    if (lightOffsets.isNotEmpty) {
      canvas.drawPoints(PointMode.points, lightOffsets, lightPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _GrainSurfacePainter oldDelegate) {
    return oldDelegate.tintColor != tintColor || oldDelegate.intensity != intensity;
  }
}
