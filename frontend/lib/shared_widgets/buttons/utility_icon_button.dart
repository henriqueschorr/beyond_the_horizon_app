import 'package:flutter/material.dart';
import '../../theme/color/app_colors.dart';
import '../../theme/shaders/grain_surface.dart';
import '../../theme/typograph/app_typography.dart';

/// Flanking rounded-square utility icon button specified in SDD 04 Section 5.3.
/// 44x44px dimensions, GrainSurface noise texture, monospaced tooltip, and 1.04 micro-scale.
class UtilityIconButton extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;

  const UtilityIconButton({
    super.key,
    required this.icon,
    required this.tooltip,
    this.onPressed,
  });

  @override
  State<UtilityIconButton> createState() => _UtilityIconButtonState();
}

class _UtilityIconButtonState extends State<UtilityIconButton> {
  bool _isHovered = false;

  void _handleHover(bool hovering) {
    if (_isHovered != hovering) {
      setState(() => _isHovered = hovering);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onPressed != null;

    final borderColor = _isHovered && isEnabled
        ? AppColors.accentOrange
        : AppColors.darkBorderProminent;

    final iconColor = _isHovered && isEnabled
        ? AppColors.accentOrange
        : AppColors.darkTextPrimary;

    return Tooltip(
      message: widget.tooltip,
      textStyle: AppTypography.tacticalLabelSmall,
      decoration: BoxDecoration(
        color: AppColors.darkBgSurfaceElevated,
        border: Border.all(color: AppColors.accentOrange, width: 1.0),
        borderRadius: BorderRadius.circular(4.0),
      ),
      waitDuration: const Duration(milliseconds: 300),
      child: MouseRegion(
        cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
        onEnter: (_) => _handleHover(true),
        onExit: (_) => _handleHover(false),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedScale(
            scale: _isHovered && isEnabled ? 1.04 : 1.0,
            duration: const Duration(milliseconds: 140),
            curve: Curves.easeOutCubic,
            child: Container(
              width: 44.0,
              height: 44.0,
              decoration: BoxDecoration(
                color: AppColors.darkBgSurface,
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(color: borderColor, width: 1.0),
                boxShadow: _isHovered && isEnabled
                    ? [
                        BoxShadow(
                          color: AppColors.accentOrange.withValues(alpha: 0.20),
                          blurRadius: 8.0,
                          offset: const Offset(0, 1),
                        )
                      ]
                    : null,
              ),
              child: GrainSurface(
                tintColor: _isHovered ? AppColors.accentOrange : null,
                intensity: _isHovered ? 1.3 : 1.0,
                child: Center(
                  child: Icon(
                    widget.icon,
                    size: 20.0,
                    color: iconColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
