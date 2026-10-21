import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/service_locator.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared_widgets/layout/responsive_telemetry_guard.dart';
import '../../../theme/color/app_colors.dart';
import '../../../theme/shaders/grain_surface.dart';
import '../../../theme/shaders/star_surface.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../auth/widgets/registration_dialog.dart';
import '../../settings/controllers/settings_controller.dart';
import '../../settings/widgets/terminal_settings_drawer.dart';
import '../widgets/crossword_brand_mark.dart';
import '../widgets/event_horizon_arc.dart';
import '../widgets/logged_out_access_console.dart';

/// Standalone Public Landing Page specified in SDD 04 Section 6.
/// Houses the monumental typographic crossword brand mark, spherical event horizon arc,
/// and unauthenticated access console with zero dependencies on authenticated home features.
/// Complies with Rule 10 of Agents.md: pure StatelessWidget with constructor initializer resolution.
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

    return ResponsiveTelemetryGuard(
      child: ListenableBuilder(
        listenable: settingsController,
        builder: (context, _) {
          return Scaffold(
            backgroundColor: AppColors.darkBgCanvas,
            endDrawer: TerminalSettingsDrawer(settingsController: settingsController),
            body: GrainSurface(
              enabled: settingsController.isNoiseEnabled,
              child: StarSurface(
            child: LayoutBuilder(
            builder: (context, constraints) {
              final double width = constraints.maxWidth;
              final double height = constraints.maxHeight;

              // Asymmetric responsive scaling: fluidly scale monumental typography
              // on viewport heights below 920px while preserving ergonomic login well dimensions.
              final double brandScale = (height / 920.0).clamp(0.68, 1.0);
              final double effectiveCellSize = CrosswordBrandMark.baseCellSize * brandScale;
              final double effectiveBrandHeight = 456.0 * brandScale;

              const double consoleHeight = 200.0;
              final double totalStackHeight =
                  effectiveBrandHeight + consoleHeight + (48.0 * brandScale);
              final double brandMarkTop =
                  math.max(16.0, (height - totalStackHeight) / 2);

              final double apexY = brandMarkTop + (4 * effectiveCellSize);
              final double consoleTop =
                  brandMarkTop + effectiveBrandHeight + (24.0 * brandScale);

              const double brandMarkWidth = 532.0;
              final double centeredBrandX = (width - brandMarkWidth) / 2;
              final double singularityX = width / 2.0;

              return Stack(
                children: [
                  // LAYER 1: Spherical Event Horizon Arc
                  Positioned.fill(
                    child: EventHorizonArc(
                      apexX: singularityX,
                      apexY: apexY,
                    ),
                  ),

                  // LAYER 2: Centered Monumental Crossword Brand Mark
                  Positioned(
                    left: centeredBrandX,
                    top: brandMarkTop,
                    child: CrosswordBrandMark(scale: brandScale),
                  ),

                  // LAYER 3: Landing Access Console
                  Positioned(
                    left: 0,
                    right: 0,
                    top: consoleTop,
                    child: Builder(
                      builder: (scaffoldContext) {
                        return LoggedOutAccessConsole(
                          authController: authController,
                          onSignIn: () async {
                            final success = await authController.signIn(l10n);
                            if (success && scaffoldContext.mounted) {
                              scaffoldContext.go('/home');
                            }
                          },
                          onOpenRegistration: () {
                            showDialog(
                              context: scaffoldContext,
                              builder: (ctx) => RegistrationDialog(
                                authController: authController,
                              ),
                            );
                          },
                          onOpenCodex: () {
                            scaffoldContext.go('/blank');
                          },
                          onOpenSettings: () {
                            Scaffold.of(scaffoldContext).openEndDrawer();
                          },
                        );
                      },
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
