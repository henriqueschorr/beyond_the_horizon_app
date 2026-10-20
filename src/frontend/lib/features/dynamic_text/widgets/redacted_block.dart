import 'package:flutter/material.dart';

import '../../../theme/color/app_colors.dart';

/// Redacted black box widget masking classified lore transmissions.
class RedactedBlock extends StatelessWidget {
  final double width;

  const RedactedBlock({
    super.key,
    this.width = 64.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 14.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: AppColors.darkBgWell,
        border: Border.all(color: AppColors.darkBorderProminent, width: 0.8),
        borderRadius: BorderRadius.circular(1.0),
      ),
    );
  }
}
