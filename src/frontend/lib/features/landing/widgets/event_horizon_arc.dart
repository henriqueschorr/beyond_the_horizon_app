import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../theme/color/app_colors.dart';

/// Spherical Event Horizon Arc specified in SDD 04 Section 6.2.
/// Sweeps up from off-screen left to a monumental spherical crest beneath the brand mark
/// and continues its circular trajectory until exiting cleanly through the bottom of the viewport.
class EventHorizonArc extends StatelessWidget {
  final double apexX;
  final double apexY;
  final Widget? child;

  const EventHorizonArc({
    super.key,
    required this.apexX,
    required this.apexY,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _EventHorizonArcPainter(
        apexX: apexX,
        apexY: apexY,
      ),
      child: child,
    );
  }
}

class _EventHorizonArcPainter extends CustomPainter {
  final double apexX;
  final double apexY;

  const _EventHorizonArcPainter({
    required this.apexX,
    required this.apexY,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    final double deltaY = math.max(100.0, size.height - apexY);

    // True spherical radius calibrated to form an authentic celestial sphere.
    // Scales harmoniously across viewports while ensuring the right leg completes
    // its downward arc and exits through the bottom of the page.
    final double radius = math.max(size.width * 0.52, deltaY * 1.30);
    final double cy = apexY + radius;

    const double extraX = 80.0;
    final double bottomY = size.height + 40.0;
    final double maxDy = (bottomY - apexY).clamp(0.0, radius * 0.98);

    // 1. Right endpoint: exact circle intersection at bottomY
    final double dxBottom = math.sqrt(math.max(0.0, maxDy * (2.0 * radius - maxDy)));
    final double endX = apexX + dxBottom;
    final double endY = apexY + maxDy;

    // 2. Left endpoint: exact circle intersection at startX = -extraX
    const double startX = -extraX;
    final double dxLeft = (apexX - startX).clamp(0.0, radius * 0.98);
    final double startY = cy - math.sqrt(math.max(0.0, radius * radius - dxLeft * dxLeft));

    // Clip strictly to canvas bounds so the extended arc cleanly exits the viewport
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // 3. Exact circular arc path from start to end via Skia addArc:
    final circleRect = Rect.fromCircle(center: Offset(apexX, cy), radius: radius);
    final double startAngle = math.atan2(startY - cy, startX - apexX);
    final double endAngle = math.atan2(endY - cy, endX - apexX);
    final double sweepAngle = endAngle - startAngle;

    final arcPath = Path()..addArc(circleRect, startAngle, sweepAngle);

    // 4. Black hole singularity gravitational void beneath the circular arc:
    final voidPath = Path()
      ..addArc(circleRect, startAngle, sweepAngle)
      ..lineTo(endX, bottomY + 20.0)
      ..lineTo(startX, bottomY + 20.0)
      ..close();

    final voidPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF030304), // Absolute singularity gravitational void
          const Color(0xFF080A0D),
          AppColors.darkBgCanvas,
        ],
        stops: const [0.0, 0.45, 1.0],
      ).createShader(Rect.fromLTWH(0, apexY, size.width, size.height - apexY));

    canvas.drawPath(voidPath, voidPaint);

    // 5. Draw the 4 luminous halo tiers along the exact circular arc:

    // Tier 1: Vast outer silver gravitational halo (broad continuous Gaussian bloom)
    final outerHaloPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 36.0
      ..color = const Color(0xFFF1F5F9).withValues(alpha: 0.18)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 28.0);
    canvas.drawPath(arcPath, outerHaloPaint);

    // Tier 2: Dense luminous silver corona (core Gaussian body)
    final coronaPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16.0
      ..color = const Color(0xFFFFFFFF).withValues(alpha: 0.38)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12.0);
    canvas.drawPath(arcPath, coronaPaint);

    // Tier 3: Intense radiant white bloom
    final photonRingPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..color = const Color(0xFFFFFFFF).withValues(alpha: 0.70)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4.0);
    canvas.drawPath(arcPath, photonRingPaint);

    // Tier 4: Razor-sharp incandescent silver-white core threshold line
    final coreLinePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..shader = LinearGradient(
        colors: [
          const Color(0xFF94A3B8),
          const Color(0xFFE2E8F0),
          const Color(0xFFFFFFFF), // Brilliant pure white incandescent apex
          const Color(0xFFE2E8F0),
          const Color(0xFF94A3B8),
        ],
        stops: const [0.0, 0.30, 0.5, 0.70, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawPath(arcPath, coreLinePaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _EventHorizonArcPainter oldDelegate) {
    return oldDelegate.apexX != apexX || oldDelegate.apexY != apexY;
  }
}
