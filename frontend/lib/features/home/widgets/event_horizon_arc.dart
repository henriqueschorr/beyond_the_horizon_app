import 'package:flutter/material.dart';
import '../../../theme/color/app_colors.dart';

/// Parabolic Event Horizon Arc specified in SDD 04 Section 6.2.
/// Sweeps up to an apex just beneath HORIZON and strictly exits through the lateral screen borders.
class EventHorizonArc extends StatelessWidget {
  final double apexY;
  final double lateralExitRatio;
  final Widget? child;

  const EventHorizonArc({
    super.key,
    required this.apexY,
    this.lateralExitRatio = 0.68,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _EventHorizonArcPainter(
        apexY: apexY,
        lateralExitRatio: lateralExitRatio,
      ),
      child: child,
    );
  }
}

class _EventHorizonArcPainter extends CustomPainter {
  final double apexY;
  final double lateralExitRatio;

  const _EventHorizonArcPainter({
    required this.apexY,
    required this.lateralExitRatio,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    final lateralY = size.height * lateralExitRatio;

    // Extend the parabola beyond lateral edges to eliminate odd angular cutoffs/endpoints
    const extraX = 80.0;
    final a = 4.0 * (lateralY - apexY) / (size.width * size.width);
    final extendedDist = size.width / 2 + extraX;
    final extendedY = apexY + a * extendedDist * extendedDist;
    final extendedControlY = 2 * apexY - extendedY;

    // Clip strictly to canvas bounds so the extended arc cleanly exits the viewport
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // 1. Black hole void area beneath the arc
    final voidPath = Path()
      ..moveTo(-extraX, extendedY)
      ..quadraticBezierTo(size.width / 2, extendedControlY, size.width + extraX, extendedY)
      ..lineTo(size.width + extraX, size.height + 20.0)
      ..lineTo(-extraX, size.height + 20.0)
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

    // 2. Parabolic event horizon path extended off-screen
    final arcPath = Path()
      ..moveTo(-extraX, extendedY)
      ..quadraticBezierTo(size.width / 2, extendedControlY, size.width + extraX, extendedY);

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
    return oldDelegate.apexY != apexY ||
        oldDelegate.lateralExitRatio != lateralExitRatio;
  }
}
