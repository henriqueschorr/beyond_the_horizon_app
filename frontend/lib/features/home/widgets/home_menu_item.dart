import 'package:flutter/material.dart';

import '../../../theme/color/app_colors.dart';
import '../../../theme/shaders/grain_surface.dart';
import '../../../theme/typograph/semantic_text_widgets.dart';

/// Reusable tactical navigation menu item adhering to SDD 04 Section 7.2.
/// Implements Concept 1 (Snug Solid Carrier with Kinetic Leading Arrow):
/// - Resting: Clean titanium white label, no divider lines, no numeric prefix or telemetry tags.
/// - Hover: Compact Signal Orange (`#FE6403`) carrier block hugging content width,
///   animated leading arrow (`➤`), and complete typographic inversion to void black (`#101214`).
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(
            horizontal: 14.0,
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.accentOrange : Colors.transparent,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: GrainSurface(
            intensity: _isHovered ? 0.85 : 0.0,
            isForeground: true,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                // Ghost reference row: Guarantees intrinsic width includes arrow + label width
                // regardless of hover state, ensuring all items share the exact same box width.
                Opacity(
                  opacity: 0.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 40.0),
                      ActionLabelLargeText(widget.label),
                    ],
                  ),
                ),

                // Interactive Row
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Animated Leading Arrow: ➤
                    ClipRect(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 140),
                        curve: Curves.easeOutCubic,
                        width: _isHovered ? 40.0 : 0.0,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 120),
                              opacity: _isHovered ? 1.0 : 0.0,
                              child: const ActionLabelLargeInvertedText('➤'),
                            ),
                            const SizedBox(width: 16.0),
                          ],
                        ),
                      ),
                    ),

                    // Primary Action Label
                    _isHovered
                        ? ActionLabelLargeInvertedText(widget.label)
                        : ActionLabelLargeText(widget.label),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
