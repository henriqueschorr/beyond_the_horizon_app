import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/service_locator.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../auth/widgets/registration_dialog.dart';
import '../../settings/controllers/settings_controller.dart';
import '../../../l10n/app_localizations.dart';
import '../widgets/logged_out_access_console.dart';

/// Public Landing Page specified in SDD 04 Section 6.
/// Houses the unauthenticated access console with zero dependencies on authenticated home features.
class LandingPage extends StatelessWidget {
  final AuthController authController;
  final SettingsController settingsController;

  LandingPage({
    super.key,
    AuthController? authController,
    SettingsController? settingsController,
  })  : authController = authController ?? serviceLocator<AuthController>(),
        settingsController = settingsController ?? serviceLocator<SettingsController>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return LoggedOutAccessConsole(
      authController: authController,
      onSignIn: () async {
        final success = await authController.signIn(l10n);
        if (success && context.mounted) {
          context.go('/home');
        }
      },
      onOpenRegistration: () {
        showDialog(
          context: context,
          builder: (ctx) => RegistrationDialog(authController: authController),
        );
      },
      onOpenSettings: () {
        Scaffold.of(context).openEndDrawer();
      },
    );
  }
}
