import 'package:flutter/material.dart';

import '../../../theme/color/app_colors.dart';
import '../../../theme/shaders/grain_surface.dart';
import '../../../theme/typograph/semantic_text_widgets.dart';

/// Reusable tactical navigation menu item adhering to SDD 04 Section 7.2.
/// Features the organic hand-drawn styled Cassette 90 Vibrant Orange arrow hover interaction:
/// - Rest State: Text symmetrically enclosed by brackets [ PLAY WITH CHARACTER ].
/// - Hover State: Trailing bracket ] dissolves, an orange arrow emerges behind the text
///   from the opening bracket [, and text inverts to canvas black (#101214) over the arrow
///   with analog toner GrainSurface texture.
class HomeMenuItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const HomeMenuItem({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  State<HomeMenuItem> createState() => _HomeMenuItemState();
}

class _HomeMenuItemState extends State<HomeMenuItem> {
  bool _isHovered = false;

  void _handleHover(bool hovering) {
    if (_isHovered != hovering) {
      setState(() => _isHovered = hovering);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Opening Bracket [
              const ActionLabelLargeText('['),

              const SizedBox(width: 6.0),

              // Interactive Text & Hover Arrow Core
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerLeft,
                children: [
                  // Animated Arrow Background (Positioned so it doesn't alter rest-state bracket symmetry)
                  Positioned(
                    left: -4.0,
                    top: -4.0,
                    bottom: -4.0,
                    right: -36.0,
                    child: AnimatedOpacity(
                      opacity: _isHovered ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 160),
                      curve: Curves.easeOutCubic,
                      child: const GrainSurface(
                        intensity: 0.55,
                        child: CustomPaint(
                          painter: _MenuArrowPainter(
                            color: AppColors.accentOrange,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Text Layer
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                    child: _isHovered
                        ? ActionLabelLargeInvertedText(widget.label)
                        : ActionLabelLargeText(widget.label),
                  ),
                ],
              ),

              const SizedBox(width: 6.0),

              // Trailing Bracket ] (Dissolves cleanly on hover, exactly equidistant to opening bracket)
              AnimatedOpacity(
                opacity: _isHovered ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 120),
                child: const ActionLabelLargeText(']'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Custom painter for the organic right-pointing tactical menu arrow.
class _MenuArrowPainter extends CustomPainter {
  final Color color;

  const _MenuArrowPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Geometry: Shaft stretches across the container, terminating in a sharp arrowhead
    const double headWidth = 28.0;
    final double shaftWidth = size.width - headWidth;
    final double midY = size.height / 2.0;
    const double headExtension = 7.0;

    final path = Path();
    // Top-left of shaft
    path.moveTo(0, 0);
    // Top-right of shaft
    path.lineTo(shaftWidth, 0);
    // Upper barb of arrowhead
    path.lineTo(shaftWidth, -headExtension);
    // Apex of arrowhead pointing right
    path.lineTo(size.width, midY);
    // Lower barb of arrowhead
    path.lineTo(shaftWidth, size.height + headExtension);
    // Bottom-right of shaft
    path.lineTo(shaftWidth, size.height);
    // Bottom-left of shaft
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _MenuArrowPainter oldDelegate) => oldDelegate.color != color;
}
