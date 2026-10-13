import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../shared_widgets/buttons/secondary_action_button.dart';
import '../../../shared_widgets/buttons/tactical_action_button.dart';
import '../../../shared_widgets/inputs/recessed_input_field.dart';
import '../../../theme/typograph/semantic_text_widgets.dart';
import '../../auth/controllers/auth_controller.dart';

/// Standalone login form widget adhering to Rule 8 of Agents.md.
/// Encapsulates email/password input fields, selectable error display, and sign-in/register actions.
class LoginForm extends StatelessWidget {
  final AuthController authController;
  final VoidCallback onSignIn;
  final VoidCallback onOpenRegistration;

  const LoginForm({
    super.key,
    required this.authController,
    required this.onSignIn,
    required this.onOpenRegistration,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SizedBox(
      width: 320.0,
      child: ListenableBuilder(
        listenable: authController,
        builder: (context, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Email Input
              RecessedInputField(
                label: l10n.auth.emailLabel,
                placeholder: l10n.auth.emailPlaceholder,
                onChanged: (value) => authController.setEmail(value),
                onSubmitted: (_) => onSignIn(),
              ),
              const SizedBox(height: 12.0),

              // Password Input
              RecessedInputField(
                label: l10n.auth.passwordLabel,
                placeholder: l10n.auth.passwordPlaceholder,
                isPassword: true,
                onChanged: (value) => authController.setPassword(value),
                onSubmitted: (_) => onSignIn(),
              ),

              // Selectable Error Message (allows users to highlight and copy diagnostic text)
              if (authController.errorMessage != null) ...[
                const SizedBox(height: 8.0),
                SelectableErrorText(
                  authController.errorMessage!,
                  textAlign: TextAlign.center,
                ),
              ],

              const SizedBox(height: 20.0),

              // Action Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SecondaryActionButton(
                    label: l10n.auth.registerAction,
                    onPressed: onOpenRegistration,
                  ),
                  TacticalActionButton(
                    label: l10n.auth.signInAction,
                    isLoading: authController.isLoading,
                    onPressed: onSignIn,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
