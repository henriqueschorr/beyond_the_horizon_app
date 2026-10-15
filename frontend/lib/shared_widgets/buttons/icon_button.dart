import 'package:flutter/material.dart' hide IconButton;

import '../../theme/color/app_colors.dart';
import '../../theme/typograph/semantic_text_widgets.dart';

/// Tactile icon button component that supports optional text labels, muted states, and hover feedback.
/// Used across command deck footers, dialog closures, and utility docks.
class IconButton extends StatefulWidget {
  final IconData icon;
  final String? label;
  final VoidCallback? onPressed;
  final bool isMuted;
  final bool isHighlighted;

  const IconButton({
    super.key,
    required this.icon,
    this.label,
    this.onPressed,
    this.isMuted = false,
    this.isHighlighted = false,
  });

  @override
  State<IconButton> createState() => _IconButtonState();
}

class _IconButtonState extends State<IconButton> {
  bool _isHovered = false;

  void _handleHover(bool hovering) {
    if (_isHovered != hovering) {
      setState(() => _isHovered = hovering);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onPressed != null;

    final effectiveBorder = _isHovered && isEnabled
        ? AppColors.accentOrange
        : (widget.isHighlighted
            ? AppColors.accentOrange
            : (widget.isMuted ? AppColors.darkBorderSubtle : AppColors.darkBorderProminent));

    final effectiveBackground = _isHovered && isEnabled
        ? AppColors.darkBgSurfaceElevated
        : AppColors.darkBgSurface;

    final effectiveIconColor = _isHovered && isEnabled
        ? AppColors.accentOrange
        : (widget.isHighlighted
            ? AppColors.accentOrange
            : (widget.isMuted ? AppColors.darkTextMuted : AppColors.darkTextSecondary));

    final padding = widget.label != null
        ? const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0)
        : const EdgeInsets.all(10.0);

    return MouseRegion(
      cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          padding: padding,
          decoration: BoxDecoration(
            color: effectiveBackground,
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(color: effectiveBorder, width: 1.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 16.0,
                color: effectiveIconColor,
              ),
              if (widget.label != null) ...[
                const SizedBox(width: 8.0),
                _isHovered && isEnabled
                    ? ActionLabelSmallHighlightedText(widget.label!)
                    : (widget.isMuted
                        ? ActionLabelSmallMutedText(widget.label!)
                        : ActionLabelSmallText(widget.label!)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
