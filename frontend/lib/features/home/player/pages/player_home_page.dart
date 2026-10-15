import 'package:flutter/material.dart' hide IconButton;
import 'package:go_router/go_router.dart';

import '../../../../core/service_locator.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared_widgets/buttons/icon_button.dart';
import '../../../../shared_widgets/layout/responsive_telemetry_guard.dart';
import '../../../../theme/color/app_colors.dart';
import '../../../../theme/shaders/star_surface.dart';
import '../../../auth/controllers/auth_controller.dart';
import '../../../settings/controllers/settings_controller.dart';
import '../../../settings/widgets/terminal_settings_drawer.dart';
import '../../widgets/home_brand_mark.dart';
import '../controllers/lore_epigraph_controller.dart';
import '../widgets/lore_epigraph_box.dart';
import '../widgets/player_greeting.dart';
import '../widgets/player_menu.dart';

/// Authenticated Player Home (Command Deck) implementing Minimalist Brutalism.
/// Adheres strictly to SDD 04 Section 7 and Rules 8, 10, 11 of Agents.md.
/// Structured into two balanced vertical columns:
/// - Left column: Monumental brand mark, tactical menu, and bottom-left session termination.
/// - Right column: Horizontally centered player greeting (bottom aligned to brand mark)
///   and horizontally centered lore epigraph box.
class PlayerHomePage extends StatelessWidget {
  final AuthController authController;
  final SettingsController settingsController;
  final LoreEpigraphController loreEpigraphController;

  PlayerHomePage({
    super.key,
    AuthController? authController,
    SettingsController? settingsController,
    LoreEpigraphController? loreEpigraphController,
  })  : authController = authController ?? serviceLocator<AuthController>(),
        settingsController =
            settingsController ?? serviceLocator<SettingsController>(),
        loreEpigraphController =
            loreEpigraphController ?? serviceLocator<LoreEpigraphController>();

  Future<void> _handleSignOut(BuildContext context) async {
    await authController.signOut();
    if (context.mounted) {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ResponsiveTelemetryGuard(
      child: ListenableBuilder(
        listenable: settingsController,
        builder: (context, _) {
          return Scaffold(
            backgroundColor: AppColors.darkBgCanvas,
            endDrawer: TerminalSettingsDrawer(
              settingsController: settingsController,
            ),
            body: StarSurface(
              child: Builder(
                builder: (scaffoldContext) {
                  return ListenableBuilder(
                    listenable: authController,
                    builder: (context, _) {
                      final operativeName =
                          authController.currentUser?.displayName ?? '';

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48.0,
                          vertical: 40.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // LEFT COLUMN: Brand Mark, Tactical Menu, and Session Termination
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Top: Home Brand Mark (Height: 90.0)
                                  const HomeBrandMark(),

                                  // Middle: PlayerMenu vertically centered in the left column
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: PlayerMenu(
                                        onPlayWithCharacter: () =>
                                            context.go('/blank'),
                                        onCreateCharacter: () =>
                                            context.go('/blank'),
                                        onOpenCodex: () => context.go('/blank'),
                                        onOpenSettings: () =>
                                            Scaffold.of(scaffoldContext)
                                                .openEndDrawer(),
                                      ),
                                    ),
                                  ),

                                  // Bottom: Session Termination (⏻ SIGN OUT via IconButton) anchored in 90.0 slot
                                  SizedBox(
                                    height: 90.0,
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: IconButton(
                                        icon: Icons.power_settings_new_outlined,
                                        label: l10n.dashboard.signOutTitle,
                                        isMuted: true,
                                        onPressed: () => _handleSignOut(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // RIGHT COLUMN: Left-Aligned Greeting & Vertically Centered Lore Epigraph Box
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Top: Player Greeting left-aligned with bottom at 90.0 matching HomeBrandMark
                                  SizedBox(
                                    height: 90.0,
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: PlayerGreeting(
                                          callsign: operativeName),
                                    ),
                                  ),

                                  // Middle: Lore Epigraph Box vertically centered in remaining space
                                  Expanded(
                                    child: Center(
                                      child: LoreEpigraphBox(
                                        controller: loreEpigraphController,
                                      ),
                                    ),
                                  ),

                                  // Bottom: Symmetric balancing spacer ensuring true vertical viewport centering
                                  const SizedBox(height: 90.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
