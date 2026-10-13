import 'package:flutter/material.dart';

import '../../theme/color/app_colors.dart';

/// Machined tactical vertical seam line divider featuring subtle gradient falloff.
/// Composes structural console seams adhering to Rule 13 of Agents.md.
class VerticalSeamDivider extends StatelessWidget {
  final double horizontalPadding;
  final double thickness;
  final Color? color;

  const VerticalSeamDivider({
    super.key,
    this.horizontalPadding = 36.0,
    this.thickness = 1.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AppColors.darkBorderSubtle;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Container(
        width: thickness,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              effectiveColor.withValues(alpha: 0.1),
              effectiveColor,
              effectiveColor,
              effectiveColor.withValues(alpha: 0.1),
            ],
            stops: const [0.0, 0.15, 0.85, 1.0],
          ),
        ),
      ),
    );
  }
}
