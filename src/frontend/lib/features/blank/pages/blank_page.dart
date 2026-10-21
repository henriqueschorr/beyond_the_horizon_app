import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/color/app_colors.dart';
import '../../../theme/typograph/semantic_text_widgets.dart';

/// Minimal temporary blank page displaying a centered BLANK title and return action.
class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBgCanvas,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DisplayTitleText('BLANK'),
            const SizedBox(height: 24.0),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/');
                  }
                },
                child: const NavAnchorHighlightedText('// RETURN TO ACCESS CONSOLE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

