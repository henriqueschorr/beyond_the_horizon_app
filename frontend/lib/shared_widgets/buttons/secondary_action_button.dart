import 'package:flutter/material.dart';
import '../../theme/color/app_colors.dart';
import '../../theme/typograph/app_typography.dart';

/// Flat secondary text action button without noise texture (SDD 04 Section 5.1 & 6.3).
/// Excluded from GrainSurface to preserve ultra-crisp typography for secondary actions like Registrar.
class SecondaryActionButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final double height;

  const SecondaryActionButton({
    super.key,
    required this.label,
    this.onPressed,
    this.height = 42.0,
  });

  @override
  State<SecondaryActionButton> createState() => _SecondaryActionButtonState();
}

class _SecondaryActionButtonState extends State<SecondaryActionButton> {
  bool _isHovered = false;

  void _handleHover(bool hovering) {
    if (_isHovered != hovering) {
      setState(() => _isHovered = hovering);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onPressed != null;

    final textColor = _isHovered && isEnabled
        ? AppColors.darkTextPrimary
        : AppColors.darkTextSecondary;

    final borderColor = _isHovered && isEnabled
        ? AppColors.darkBorderProminent
        : AppColors.darkBorderSubtle;

    return MouseRegion(
      cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          height: widget.height,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.darkBgSurface : Colors.transparent,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: borderColor, width: 1.0),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: AppTypography.actionLabel.copyWith(
                color: textColor,
                decoration: _isHovered ? TextDecoration.underline : TextDecoration.none,
                decorationColor: AppColors.darkTextSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
