import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../auth/controllers/auth_controller.dart';
import '../../auth/widgets/registration_dialog.dart';
import '../../../core/service_locator.dart';
import '../../../theme/shaders/crt_surface.dart';
import '../../../theme/shaders/star_surface.dart';
import '../../../theme/color/app_colors.dart';
import '../../../theme/typograph/semantic_text_widgets.dart';
import '../../settings/controllers/settings_controller.dart';
import '../../settings/widgets/terminal_settings_drawer.dart';
import '../../../shared_widgets/buttons/secondary_action_button.dart';
import '../../../shared_widgets/buttons/tactical_action_button.dart';
import '../../../shared_widgets/buttons/utility_icon_button.dart';
import '../../../shared_widgets/inputs/recessed_input_field.dart';
import '../widgets/crossword_brand_mark.dart';
import '../widgets/event_horizon_arc.dart';
import '../widgets/responsive_telemetry_guard.dart';
import '../../../l10n/app_localizations.dart';

/// Canonical Logged-Out Home Page specified in SDD 04 Section 6.
/// Features the typographic crossword mark, parabolic event horizon arc, flanking zero-login utility buttons,
/// recessed credential inputs, and side-by-side action row.
class LoggedOutHomePage extends StatelessWidget {
  final AuthController authController;
  final SettingsController settingsController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  LoggedOutHomePage({
    super.key,
    AuthController? authController,
    SettingsController? settingsController,
  })  : authController = authController ?? serviceLocator<AuthController>(),
        settingsController = settingsController ?? serviceLocator<SettingsController>();

  void _openSettings() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  void _openRegistration(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => RegistrationDialog(authController: authController),
    );
  }

  Future<void> _handleSignIn(BuildContext context, AppLocalizations l10n) async {
    final success = await authController.signIn(l10n);
    if (success && context.mounted) {
      context.go('/dashboard');
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
            key: _scaffoldKey,
            backgroundColor: AppColors.darkBgCanvas,
            endDrawer: TerminalSettingsDrawer(settingsController: settingsController),
            body: CrtSurface(
              enabled: settingsController.isCrtEnabled,
              child: StarSurface(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final height = constraints.maxHeight;

                    // Compute vertical position: shift up by one letter height (76.0px cell)
                    // Total content height: CrosswordBrandMark (456px) + gap (32px) + Console Row (~170px) = 658px
                    const double cellSize = 76.0;
                    const double contentHeight = 658.0;
                    final double centeredTop = (height - contentHeight) / 2;
                    final double topPadding = math.max(24.0, centeredTop - cellSize);

                    // Geometric apex position directly beneath the crossword HORIZON word (4 cells down)
                    final double apexY = topPadding + (4 * cellSize);

                    return Stack(
                      children: [
                        // Layer 1: Parabolic Event Horizon Arc exiting laterally
                        Positioned.fill(
                          child: EventHorizonArc(
                            apexY: apexY,
                            lateralExitRatio: 0.65,
                          ),
                        ),

                        // Layer 2: Interactive Content
                        Positioned.fill(
                          child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: height,
                                minWidth: constraints.maxWidth,
                              ),
                              child: SizedBox(
                                width: constraints.maxWidth,
                                child: Padding(
                                  padding: EdgeInsets.only(top: topPadding, bottom: 40.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      // Monumental Crossword Brand Mark
                                      const Center(
                                        child: CrosswordBrandMark(
                                          scale: 1.0,
                                          showSubmergedLetters: true,
                                        ),
                                      ),

                                      // Generous gravitational void spacing distancing console controls from submerged 'D'
                                      const SizedBox(height: 108.0),

                                      // Access Console Row inside the Black Hole Void
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // Flanking Left: Compêndio Book Utility Button
                                            Padding(
                                              padding: const EdgeInsets.only(top: 24.0, right: 20.0),
                                              child: UtilityIconButton(
                                                icon: Icons.menu_book_outlined,
                                                tooltip: l10n.landing.compendiumTooltip,
                                                onPressed: () {
                                                  context.go('/in-construction?module=${Uri.encodeComponent(l10n.dashboard.compendiumTitle)}');
                                                },
                                              ),
                                            ),

                                            // Center: Credential Inputs & Action Row
                                            ConstrainedBox(
                                              constraints: const BoxConstraints(maxWidth: 340.0),
                                              child: ListenableBuilder(
                                                listenable: authController,
                                                builder: (context, _) {
                                                  return Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                      // Email / Callsign Input
                                                      RecessedInputField(
                                                        label: l10n.auth.emailLabel,
                                                        placeholder: l10n.auth.emailPlaceholder,
                                                        onChanged: (val) => authController.setEmail(val),
                                                        onSubmitted: (_) => _handleSignIn(context, l10n),
                                                      ),
                                                      const SizedBox(height: 12.0),

                                                      // Password Input
                                                      RecessedInputField(
                                                        label: l10n.auth.passwordLabel,
                                                        placeholder: l10n.auth.passwordPlaceholder,
                                                        isPassword: true,
                                                        onChanged: (val) => authController.setPassword(val),
                                                        onSubmitted: (_) => _handleSignIn(context, l10n),
                                                      ),

                                                      // Inline Error Message
                                                      if (authController.errorMessage != null) ...[
                                                        const SizedBox(height: 8.0),
                                                        LegendHighlightedText(
                                                          authController.errorMessage!,
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ],

                                                      const SizedBox(height: 20.0),

                                                      // Side-by-Side Action Row
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          // Left: Secondary Registrar Button (flat, no noise)
                                                          SecondaryActionButton(
                                                            label: l10n.auth.registerAction,
                                                            onPressed: () => _openRegistration(context),
                                                          ),

                                                          // Right: Primary Tactical CTA Button (GrainSurface noise)
                                                          TacticalActionButton(
                                                            label: l10n.auth.signInAction,
                                                            isLoading: authController.isLoading,
                                                            onPressed: () => _handleSignIn(context, l10n),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),

                                            // Flanking Right: Settings Gear Utility Button
                                            Padding(
                                              padding: const EdgeInsets.only(top: 24.0, left: 20.0),
                                              child: UtilityIconButton(
                                                icon: Icons.settings_outlined,
                                                tooltip: l10n.landing.settingsTooltip,
                                                onPressed: _openSettings,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
