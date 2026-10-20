import 'package:flutter/material.dart';

import '../../theme/color/app_colors.dart';

/// 2. News Frame Painter: Corporate Ticker Double Horizontal Bars.
/// Solid double horizontal bars across top and bottom, open left and right edges.
class NewsFramePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double barSpacing;

  const NewsFramePainter({
    this.color = AppColors.accentOrange,
    this.strokeWidth = 1.5,
    this.barSpacing = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Top Double Bars
    canvas.drawLine(const Offset(0, 0), Offset(size.width, 0), paint);
    canvas.drawLine(Offset(0, barSpacing), Offset(size.width, barSpacing), paint);

    // Bottom Double Bars
    canvas.drawLine(Offset(0, size.height - barSpacing), Offset(size.width, size.height - barSpacing), paint);
    canvas.drawLine(Offset(0, size.height), Offset(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant NewsFramePainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.barSpacing != barSpacing;
}

/// Reusable container widget decorating child content with the News ticker frame.
class NewsFrame extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;

  const NewsFrame({
    super.key,
    required this.child,
    this.color = AppColors.accentOrange,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 22.0),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: NewsFramePainter(color: color),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
