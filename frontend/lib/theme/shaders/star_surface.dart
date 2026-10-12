import 'dart:math';
import 'package:flutter/material.dart';

/// Deterministic sub-pixel starfield generator codified in SDD 04 Section 2.2.
/// Generates 160 stars with fixed seed 42 and central reading corridor attenuation.
class StarSurface extends StatelessWidget {
  final Widget? child;

  const StarSurface({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        painter: const _StarSurfacePainter(),
        child: child,
      ),
    );
  }
}

class _StarData {
  final double xRatio;
  final double yRatio;
  final double radius;
  final double baseAlpha;

  const _StarData({
    required this.xRatio,
    required this.yRatio,
    required this.radius,
    required this.baseAlpha,
  });
}

class _StarSurfacePainter extends CustomPainter {
  static const int _starCount = 160;
  static const int _seed = 42;

  static final List<_StarData> _cachedStars = _generateStars();

  const _StarSurfacePainter();

  static List<_StarData> _generateStars() {
    final random = Random(_seed);
    final list = <_StarData>[];
    for (int i = 0; i < _starCount; i++) {
      final x = random.nextDouble();
      final y = random.nextDouble();
      // Sizes between 0.6px and 2.2px
      final radius = 0.6 + random.nextDouble() * 1.6;
      // Alpha between 0.15 and 0.85
      final alpha = 0.15 + random.nextDouble() * 0.70;
      list.add(_StarData(xRatio: x, yRatio: y, radius: radius, baseAlpha: alpha));
    }
    return list;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    final center = Offset(size.width / 2, size.height * 0.45);
    final maxDist = sqrt(pow(size.width / 2, 2) + pow(size.height / 2, 2));

    // Subtle cosmic radial wash
    final washPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.0, -0.1),
        radius: 0.85,
        colors: [
          const Color(0xFF1E242C).withValues(alpha: 0.35),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), washPaint);

    final starPaint = Paint()..style = PaintingStyle.fill;

    for (final star in _cachedStars) {
      final pos = Offset(star.xRatio * size.width, star.yRatio * size.height);

      // Central reading corridor attenuation:
      // Distance from center reduces alpha so text remains 100% legible
      final distFromCenter = (pos - center).distance;
      final corridorFactor = (distFromCenter / (maxDist * 0.40)).clamp(0.20, 1.0);

      final finalAlpha = (star.baseAlpha * corridorFactor).clamp(0.0, 1.0);
      starPaint.color = const Color(0xFFF0ECE1).withValues(alpha: finalAlpha);

      canvas.drawCircle(pos, star.radius, starPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _StarSurfacePainter oldDelegate) => false;
}
