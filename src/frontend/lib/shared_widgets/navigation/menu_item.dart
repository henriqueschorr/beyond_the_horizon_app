import 'package:flutter/material.dart';

import '../../theme/color/app_colors.dart';
import '../../theme/shaders/grain_surface.dart';
import '../../theme/typograph/semantic_text_widgets.dart';

/// Standalone tactile navigation menu item with hover animation,
/// GrainSurface badge, and action label.
/// Adheres strictly to Rule 8, Rule 11, and Rule 13 of Agents.md.
class MenuItem extends StatefulWidget {
  final Widget icon;
  final String label;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool _isHovered = false;

  void _handleHover(bool hovering) {
    if (_isHovered != hovering) {
      setState(() => _isHovered = hovering);
    }
  }

  @override
  Widget build(BuildContext context) {
    final highlightColor = AppColors.accentOrange;
    final nodeBorderColor = _isHovered ? highlightColor : AppColors.darkBorderProminent;

    const double nodeSize = 40.0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Tactile Node Badge
            AnimatedContainer(
              duration: const Duration(milliseconds: 140),
              width: nodeSize,
              height: nodeSize,
              decoration: BoxDecoration(
                color: AppColors.darkBgSurfaceElevated,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: nodeBorderColor, width: 1.2),
              ),
              child: GrainSurface(
                intensity: 0.6,
                isForeground: true,
                child: Center(
                  child: IconTheme(
                    data: IconThemeData(
                      color: _isHovered ? highlightColor : AppColors.darkTextPrimary,
                      size: 20.0,
                    ),
                    child: widget.icon,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 18.0),

            // Action Label
            AnimatedSlide(
              offset: _isHovered ? const Offset(0.04, 0.0) : Offset.zero,
              duration: const Duration(milliseconds: 140),
              curve: Curves.easeOutCubic,
              child: _isHovered
                  ? NavAnchorHighlightedText(widget.label)
                  : NavAnchorText(widget.label),
            ),
          ],
        ),
      ),
    );
  }
}
