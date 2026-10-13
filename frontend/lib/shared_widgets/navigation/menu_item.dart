import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/color/app_colors.dart';
import '../../theme/shaders/grain_surface.dart';
import 'menu_item_data.dart';

/// Standalone tactile navigation menu item with hover animation,
/// GrainSurface badge, and action label.
class MenuItem extends StatefulWidget {
  final MenuItemData data;

  const MenuItem({
    super.key,
    required this.data,
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
    final nodeBorderColor = _isHovered ? highlightColor : AppColors.darkBorderSubtle;
    final textColor = _isHovered ? AppColors.accentOrange : AppColors.darkTextSecondary;

    const double nodeSize = 40.0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTap: widget.data.onTap,
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
                child: Center(
                  child: IconTheme(
                    data: IconThemeData(
                      color: _isHovered ? highlightColor : AppColors.darkTextPrimary,
                      size: 20.0,
                    ),
                    child: widget.data.icon,
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
              child: Text(
                widget.data.label,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.0,
                  color: textColor,
                  height: 1.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
