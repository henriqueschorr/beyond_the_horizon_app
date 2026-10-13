import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../theme/color/app_colors.dart';

/// Bespoke vector D6 (six-sided die) tabletop RPG icon specified in SDD 04.
/// Renders a precision 3D isometric cube with chamfered borders and illuminated pips
/// (1 pip on the top face, 2 pips on the left face, and 3 pips on the right face).
class D6DieIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const D6DieIcon({
    super.key,
    this.size = 20.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? IconTheme.of(context).color ?? AppColors.darkTextPrimary;

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _D6DiePainter(color: iconColor),
      ),
    );
  }
}

class _D6DiePainter extends CustomPainter {
  final Color color;

  const _D6DiePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    final double cx = size.width / 2.0;
    final double cy = size.height / 2.0;
    // Radius from center to outer vertices, leaving small padding for stroke width
    final double r = (math.min(size.width, size.height) / 2.0) - 1.2;

    const double cos30 = 0.8660254; // math.cos(math.pi / 6)
    const double sin30 = 0.5000000; // math.sin(math.pi / 6)

    // 7 primary isometric vertices viewed from above:
    final vCenter = Offset(cx, cy);
    final vTop = Offset(cx, cy - r);
    final vTopRight = Offset(cx + r * cos30, cy - r * sin30);
    final vBottomRight = Offset(cx + r * cos30, cy + r * sin30);
    final vBottom = Offset(cx, cy + r);
    final vBottomLeft = Offset(cx - r * cos30, cy + r * sin30);
    final vTopLeft = Offset(cx - r * cos30, cy - r * sin30);

    // Paints:
    final borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    final innerLinePaint = Paint()
      ..color = color.withValues(alpha: 0.85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1
      ..strokeCap = StrokeCap.round;

    final pipFillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // 1. Draw outer silhouette hexagon
    final silhouette = Path()
      ..moveTo(vTop.dx, vTop.dy)
      ..lineTo(vTopRight.dx, vTopRight.dy)
      ..lineTo(vBottomRight.dx, vBottomRight.dy)
      ..lineTo(vBottom.dx, vBottom.dy)
      ..lineTo(vBottomLeft.dx, vBottomLeft.dy)
      ..lineTo(vTopLeft.dx, vTopLeft.dy)
      ..close();
    canvas.drawPath(silhouette, borderPaint);

    // 2. Draw 3 interior isometric edges (Y-axis junction radiating from center)
    canvas.drawLine(vCenter, vBottom, innerLinePaint); // Center to Bottom (straight down)
    canvas.drawLine(vCenter, vTopLeft, innerLinePaint); // Center to Top-Left
    canvas.drawLine(vCenter, vTopRight, innerLinePaint); // Center to Top-Right

    // Pip radius scaled to die size
    final double pipRadius = r * 0.11;

    void drawPip(Offset point) {
      canvas.drawCircle(point, pipRadius, pipFillPaint);
    }

    // 3. TOP FACE: 1 Pip (Center of top horizontal diamond face)
    final topCenter = Offset(cx, cy - (r * 0.5));
    drawPip(topCenter);

    // 4. LEFT FACE: 2 Pips (Diagonal on left parallelogram face)
    final leftCenter = Offset(cx - (r * cos30 * 0.5), cy + (r * 0.25));
    final leftDiagX = (vBottom.dx - vTopLeft.dx) * 0.24;
    final leftDiagY = (vBottom.dy - vTopLeft.dy) * 0.24;
    drawPip(Offset(leftCenter.dx - leftDiagX, leftCenter.dy - leftDiagY));
    drawPip(Offset(leftCenter.dx + leftDiagX, leftCenter.dy + leftDiagY));

    // 5. RIGHT FACE: 3 Pips (Diagonal on right parallelogram face)
    final rightCenter = Offset(cx + (r * cos30 * 0.5), cy + (r * 0.25));
    final rightDiagX = (vTopRight.dx - vBottom.dx) * 0.24;
    final rightDiagY = (vTopRight.dy - vBottom.dy) * 0.24;
    drawPip(rightCenter);
    drawPip(Offset(rightCenter.dx + rightDiagX, rightCenter.dy + rightDiagY));
    drawPip(Offset(rightCenter.dx - rightDiagX, rightCenter.dy - rightDiagY));
  }

  @override
  bool shouldRepaint(covariant _D6DiePainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
