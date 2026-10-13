import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../theme/color/app_colors.dart';
import '../../../theme/typograph/semantic_text_widgets.dart';
import '../../../shared_widgets/buttons/tactical_action_button.dart';
import '../../../shared_widgets/inputs/recessed_input_field.dart';
import '../controllers/auth_controller.dart';
import '../../../l10n/app_localizations.dart';

/// Modal dialog allowing new operative registration.
class RegistrationDialog extends StatefulWidget {
  final AuthController authController;

  const RegistrationDialog({
    super.key,
    required this.authController,
  });

  @override
  State<RegistrationDialog> createState() => _RegistrationDialogState();
}

class _RegistrationDialogState extends State<RegistrationDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleEnlistment(BuildContext context, AppLocalizations l10n) async {
    final success = await widget.authController.register(
      displayName: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      l10n: l10n,
    );

    if (success && context.mounted) {
      Navigator.of(context).pop();
      context.go('/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Dialog(
      backgroundColor: AppColors.darkBgSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: const BorderSide(color: AppColors.darkBorderProminent, width: 1.0),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 460.0),
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DisplayTitleText(l10n.registration.title),
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.darkTextPrimary),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 24.0),

            // Input fields
            RecessedInputField(
              label: l10n.registration.displayNameLabel,
              placeholder: l10n.registration.displayNamePlaceholder,
              controller: _nameController,
            ),
            const SizedBox(height: 14.0),

            RecessedInputField(
              label: l10n.registration.emailLabel,
              placeholder: l10n.registration.emailPlaceholder,
              controller: _emailController,
            ),
            const SizedBox(height: 14.0),

            RecessedInputField(
              label: l10n.registration.passwordLabel,
              placeholder: l10n.registration.passwordPlaceholder,
              controller: _passwordController,
              isPassword: true,
              onSubmitted: (_) => _handleEnlistment(context, l10n),
            ),

            ListenableBuilder(
              listenable: widget.authController,
              builder: (context, _) {
                final errorMessage = widget.authController.errorMessage;
                if (errorMessage == null) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: LegendHighlightedText(errorMessage),
                );
              },
            ),

            const SizedBox(height: 24.0),

            // Submit Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ListenableBuilder(
                  listenable: widget.authController,
                  builder: (context, _) {
                    return TacticalActionButton(
                      label: l10n.registration.submitAction,
                      isLoading: widget.authController.isLoading,
                      onPressed: () => _handleEnlistment(context, l10n),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
