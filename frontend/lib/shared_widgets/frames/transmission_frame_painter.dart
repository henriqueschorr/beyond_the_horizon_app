import 'package:flutter/material.dart';

import '../../theme/color/app_colors.dart';

/// 4. Transmission Frame Painter: Four-Corner Reticles.
/// ┌ ┐ top and └ ┘ bottom marks with open perimeter.
class TransmissionFramePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double armLength;

  const TransmissionFramePainter({
    this.color = AppColors.accentOrange,
    this.strokeWidth = 2.0,
    this.armLength = 18.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Top-Left: ┌
    final topLeft = Path();
    topLeft.moveTo(0, armLength);
    topLeft.lineTo(0, 0);
    topLeft.lineTo(armLength, 0);
    canvas.drawPath(topLeft, paint);

    // Top-Right: ┐
    final topRight = Path();
    topRight.moveTo(size.width - armLength, 0);
    topRight.lineTo(size.width, 0);
    topRight.lineTo(size.width, armLength);
    canvas.drawPath(topRight, paint);

    // Bottom-Left: └
    final bottomLeft = Path();
    bottomLeft.moveTo(0, size.height - armLength);
    bottomLeft.lineTo(0, size.height);
    bottomLeft.lineTo(armLength, size.height);
    canvas.drawPath(bottomLeft, paint);

    // Bottom-Right: ┘
    final bottomRight = Path();
    bottomRight.moveTo(size.width - armLength, size.height);
    bottomRight.lineTo(size.width, size.height);
    bottomRight.lineTo(size.width, size.height - armLength);
    canvas.drawPath(bottomRight, paint);
  }

  @override
  bool shouldRepaint(covariant TransmissionFramePainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.armLength != armLength;
}

/// Reusable container widget decorating child content with the Transmission four-corner reticle frame.
class TransmissionFrame extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;

  const TransmissionFrame({
    super.key,
    required this.child,
    this.color = AppColors.accentOrange,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 22.0),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TransmissionFramePainter(color: color),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
