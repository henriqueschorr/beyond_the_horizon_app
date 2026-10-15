import 'package:flutter/material.dart';

import '../../theme/color/app_colors.dart';

/// 1. Document Frame Painter: Vertical Folio Caps.
/// Top cap inverted-U with side flanges, bottom cap upright-U with side flanges, open sides.
class DocumentFramePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double flangeHeight;

  const DocumentFramePainter({
    this.color = AppColors.accentOrange,
    this.strokeWidth = 2.0,
    this.flangeHeight = 24.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Top Cap: 3-sided inverted-U bar
    final topPath = Path();
    topPath.moveTo(0, flangeHeight);
    topPath.lineTo(0, 0);
    topPath.lineTo(size.width, 0);
    topPath.lineTo(size.width, flangeHeight);
    canvas.drawPath(topPath, paint);

    // Bottom Cap: 3-sided upright-U bar
    final bottomPath = Path();
    bottomPath.moveTo(0, size.height - flangeHeight);
    bottomPath.lineTo(0, size.height);
    bottomPath.lineTo(size.width, size.height);
    bottomPath.lineTo(size.width, size.height - flangeHeight);
    canvas.drawPath(bottomPath, paint);
  }

  @override
  bool shouldRepaint(covariant DocumentFramePainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.flangeHeight != flangeHeight;
}

/// Reusable container widget decorating child content with the Document vertical folio frame.
class DocumentFrame extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;

  const DocumentFrame({
    super.key,
    required this.child,
    this.color = AppColors.accentOrange,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 22.0),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DocumentFramePainter(color: color),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
