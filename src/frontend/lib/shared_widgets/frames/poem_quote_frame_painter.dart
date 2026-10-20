import 'package:flutter/material.dart';

import '../../theme/color/app_colors.dart';

/// 3. Poem / Quote Frame Painter: Asymmetric Diagonal Corner Brackets.
/// Top-Left ┌ and Bottom-Right ┘ corner brackets.
class PoemQuoteFramePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double armLength;

  const PoemQuoteFramePainter({
    this.color = AppColors.accentOrange,
    this.strokeWidth = 2.0,
    this.armLength = 28.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Top-Left Corner: ┌
    final topLeft = Path();
    topLeft.moveTo(0, armLength);
    topLeft.lineTo(0, 0);
    topLeft.lineTo(armLength, 0);
    canvas.drawPath(topLeft, paint);

    // Bottom-Right Corner: ┘
    final bottomRight = Path();
    bottomRight.moveTo(size.width - armLength, size.height);
    bottomRight.lineTo(size.width, size.height);
    bottomRight.lineTo(size.width, size.height - armLength);
    canvas.drawPath(bottomRight, paint);
  }

  @override
  bool shouldRepaint(covariant PoemQuoteFramePainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.armLength != armLength;
}

/// Reusable container widget decorating child content with the Poem/Quote asymmetric frame.
class PoemQuoteFrame extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;

  const PoemQuoteFrame({
    super.key,
    required this.child,
    this.color = AppColors.accentOrange,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 22.0),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PoemQuoteFramePainter(color: color),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
