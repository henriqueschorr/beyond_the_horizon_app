import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/service_locator.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../settings/controllers/settings_controller.dart';
import '../../../l10n/app_localizations.dart';
import '../../../theme/typograph/semantic_text_widgets.dart';
import '../widgets/player_menu.dart';

/// Authenticated Home Page (Command Deck) specified in SDD 04 Section 7.
/// Houses the personalized sentence-case greeting and the dynamic role-based menu.
class HomePage extends StatelessWidget {
  final AuthController authController;
  final SettingsController settingsController;

  HomePage({
    super.key,
    AuthController? authController,
    SettingsController? settingsController,
  })  : authController = authController ?? serviceLocator<AuthController>(),
        settingsController = settingsController ?? serviceLocator<SettingsController>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListenableBuilder(
      listenable: authController,
      builder: (context, _) {
        final operativeName = authController.currentUser?.displayName ?? l10n.common.operative;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Sentence-case personalized greeting ending with a period (NOT all caps)
              DisplayTitleLargeText(
                l10n.dashboard.welcome(operativeName),
              ),

              const SizedBox(height: 36.0),

              // Role-based navigation menu
              PlayerMenu(
                onOpenSettings: () {
                  Scaffold.of(context).openEndDrawer();
                },
                onSignOut: () async {
                  await authController.signOut();
                  if (context.mounted) {
                    context.go('/');
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
