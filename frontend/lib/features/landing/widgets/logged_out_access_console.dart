import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../auth/controllers/auth_controller.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared_widgets/buttons/secondary_action_button.dart';
import '../../../shared_widgets/buttons/tactical_action_button.dart';
import '../../../shared_widgets/inputs/recessed_input_field.dart';
import '../../../shared_widgets/navigation/navigation_menu.dart';
import '../../../theme/color/app_colors.dart';
import '../../../theme/typograph/semantic_text_widgets.dart';

/// Standalone Logged-Out Access Console widget adhering strictly to
/// Rule 8 of Agents.md (no private _build widget helper methods).
class LoggedOutAccessConsole extends StatelessWidget {
  final AuthController authController;
  final VoidCallback onSignIn;
  final VoidCallback onOpenRegistration;
  final VoidCallback onOpenSettings;
  final VoidCallback? onOpenCompendium;

  const LoggedOutAccessConsole({
    super.key,
    required this.authController,
    required this.onSignIn,
    required this.onOpenRegistration,
    required this.onOpenSettings,
    this.onOpenCompendium,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.topCenter,
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Login Block (Left)
                SizedBox(
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

                          // Error Message
                          if (authController.errorMessage != null) ...[
                            const SizedBox(height: 8.0),
                            LegendHighlightedText(
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
                ),

                // Vertical Divider Seam Line (Center)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: Container(
                    width: 1.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.darkBorderSubtle.withValues(alpha: 0.1),
                          AppColors.darkBorderSubtle,
                          AppColors.darkBorderSubtle,
                          AppColors.darkBorderSubtle.withValues(alpha: 0.1),
                        ],
                        stops: const [0.0, 0.15, 0.85, 1.0],
                      ),
                    ),
                  ),
                ),

                // Standalone Compendium & Settings Utility Actions (Right)
                Center(
                  child: NavigationMenu(
                    isConnected: false,
                    itemSpacing: 20.0,
                    items: [
                      MenuItemData(
                        icon: const Icon(Icons.menu_book_outlined),
                        label: l10n.dashboard.compendiumTitle,
                        onTap: onOpenCompendium ??
                            () {
                              context.go(
                                '/in-construction?module=${Uri.encodeComponent(l10n.dashboard.compendiumTitle)}',
                              );
                            },
                      ),
                      MenuItemData(
                        icon: const Icon(Icons.settings_outlined),
                        label: l10n.dashboard.settingsTitle,
                        onTap: onOpenSettings,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
