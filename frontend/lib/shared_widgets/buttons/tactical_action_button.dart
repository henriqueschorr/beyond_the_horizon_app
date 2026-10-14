import 'package:flutter/material.dart';
import '../../theme/color/app_colors.dart';
import '../../theme/shaders/grain_surface.dart';
import '../../theme/typograph/semantic_text_widgets.dart';

/// Primary tactical CTA button specified in SDD 04 Section 5.2.
/// Features GrainSurface noise, Cassette 90 Orange border/glow, and micro-physics.
class TacticalActionButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double minWidth;
  final double height;

  const TacticalActionButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.minWidth = 140.0,
    this.height = 42.0,
  });

  @override
  State<TacticalActionButton> createState() => _TacticalActionButtonState();
}

class _TacticalActionButtonState extends State<TacticalActionButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  void _handleHover(bool hovering) {
    if (_isHovered != hovering) {
      setState(() => _isHovered = hovering);
    }
  }

  void _handleHighlight(bool pressing) {
    if (_isPressed != pressing) {
      setState(() => _isPressed = pressing);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onPressed != null && !widget.isLoading;

    final double scale = !isEnabled
        ? 1.0
        : _isPressed
            ? 0.98
            : _isHovered
                ? 1.02
                : 1.0;

    final backgroundColor = _isHovered && isEnabled
        ? AppColors.darkBgSurfaceElevated
        : AppColors.darkBgSurface;

    final borderColor = isEnabled
        ? AppColors.accentOrange
        : AppColors.darkBorderSubtle;

    final List<BoxShadow> shadows = const [];

    return MouseRegion(
      cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTapDown: isEnabled ? (_) => _handleHighlight(true) : null,
        onTapUp: isEnabled ? (_) => _handleHighlight(false) : null,
        onTapCancel: isEnabled ? () => _handleHighlight(false) : null,
        onTap: isEnabled ? widget.onPressed : null,
        child: AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOutCubic,
          child: Container(
            constraints: BoxConstraints(
              minWidth: widget.minWidth,
              minHeight: widget.height,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: borderColor, width: 1.0),
              boxShadow: shadows,
            ),
            child: GrainSurface(
              tintColor: _isHovered ? AppColors.accentOrange : null,
              intensity: _isHovered ? 1.4 : 1.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Center(
                  child: widget.isLoading
                      ? const SizedBox(
                          width: 16.0,
                          height: 16.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentOrange),
                          ),
                        )
                      : TacticalLabelSmallHighlightedText(widget.label),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
