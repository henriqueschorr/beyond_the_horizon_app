import 'package:flutter/material.dart';
import '../../theme/color/app_colors.dart';
import '../../theme/typograph/semantic_text_widgets.dart';

/// Industrial brutalist dual-segment physical rocker switch selector.
/// Complies with Universal Button Action Typography Rule and Rule 10 of Agents.md.
class BrutalistSegmentedToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String onLabel;
  final String offLabel;

  const BrutalistSegmentedToggle({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onLabel,
    required this.offLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: AppColors.darkBgSurfaceElevated,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: AppColors.darkBorderProminent,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ON Segment
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => onChanged(true),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 140),
                curve: Curves.easeOutCubic,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: value ? AppColors.accentOrange : Colors.transparent,
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Center(
                  child: value
                      ? ActionLabelSmallInvertedText(onLabel)
                      : ActionLabelSmallMutedText(onLabel),
                ),
              ),
            ),
          ),

          const SizedBox(width: 2.0),

          // OFF Segment
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => onChanged(false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 140),
                curve: Curves.easeOutCubic,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: !value ? AppColors.darkBorderProminent : Colors.transparent,
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Center(
                  child: !value
                      ? ActionLabelSmallText(offLabel)
                      : ActionLabelSmallMutedText(offLabel),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
