import 'package:flutter/material.dart';

import '../../../theme/color/app_colors.dart';
import '../../../theme/typograph/semantic_text_widgets.dart';

/// Minimal temporary blank page displaying a centered BLANK title.
class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.darkBgCanvas,
      body: Center(
        child: DisplayTitleText('BLANK'),
      ),
    );
  }
}
