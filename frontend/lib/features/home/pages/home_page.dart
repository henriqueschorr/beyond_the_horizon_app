import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/service_locator.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../settings/controllers/settings_controller.dart';
import '../../settings/widgets/terminal_settings_drawer.dart';
import '../../../l10n/app_localizations.dart';
import '../../../theme/color/app_colors.dart';
import '../../../theme/shaders/star_surface.dart';
import '../../../theme/typograph/semantic_text_widgets.dart';
import '../../../shared_widgets/layout/responsive_telemetry_guard.dart';
import '../widgets/player_menu_cards.dart';

/// Standalone Authenticated Home Page (Command Deck) implementing Minimalist Brutalism
/// with a 3-card monumental triptych, left-aligned telemetry subtitle, bottom-left
/// Settings, and bottom-right session termination actuator.
/// Enforces Rule 10 of Agents.md: StatefulWidget with constructor initializer resolution.
class HomePage extends StatefulWidget {
  final AuthController authController;
  final SettingsController settingsController;

  HomePage({
    super.key,
    AuthController? authController,
    SettingsController? settingsController,
  })  : authController = authController ?? serviceLocator<AuthController>(),
        settingsController = settingsController ?? serviceLocator<SettingsController>();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ResponsiveTelemetryGuard(
      child: ListenableBuilder(
        listenable: widget.settingsController,
        builder: (context, _) {
          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: AppColors.darkBgCanvas,
            endDrawer: TerminalSettingsDrawer(settingsController: widget.settingsController),
            body: StarSurface(
                child: ListenableBuilder(
                  listenable: widget.authController,
                  builder: (context, _) {
                    final operativeName =
                        widget.authController.currentUser?.displayName ?? l10n.common.operative;

                    return Stack(
                      children: [
                        // CENTERED CONTENT: Welcome headline, left-aligned subtitle, and 3-card triptych
                        Center(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 48.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Header Block (Constrained to match cards total width ~756px)
                                SizedBox(
                                  width: 756.0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Top Greeting Headline
                                      BodyLargeText(
                                        '${l10n.dashboard.welcomePrefix}$operativeName${l10n.dashboard.welcomeSuffix}',
                                      ),

                                      const SizedBox(height: 8.0),

                                      // Left-Aligned Telemetry Subtitle
                                      BodyMediumText(
                                        l10n.dashboard.subtitleExplore,
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 36.0),

                                // 3-Card Monumental Triptych
                                PlayerMenuCards(
                                  hasActiveCharacter: false, // OP-02 phase 1 baseline
                                  onPlayFallback: () {
                                    context.go(
                                      '/in-construction?module=${Uri.encodeComponent(l10n.dashboard.createCharacterTitle)}',
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                        // BOTTOM-LEFT CORNER ACTUATOR: Settings Drawer Launcher
                        Positioned(
                          left: 36.0,
                          bottom: 28.0,
                          child: _CornerUtilityButton(
                            icon: Icons.settings_outlined,
                            label: l10n.dashboard.settingsTitle,
                            onPressed: () {
                              _scaffoldKey.currentState?.openEndDrawer();
                            },
                          ),
                        ),

                        // BOTTOM-RIGHT CORNER ACTUATOR: Session Termination (Sign Out)
                        Positioned(
                          right: 36.0,
                          bottom: 28.0,
                          child: _CornerUtilityButton(
                            icon: Icons.logout_outlined,
                            label: l10n.dashboard.signOutSessionAction,
                            isDestructive: true,
                            onPressed: () async {
                              await widget.authController.signOut();
                              if (context.mounted) {
                                context.go('/');
                              }
                            },
                          ),
                        ),
                      ],
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

/// Standalone corner utility actuator adhering strictly to Rule 8 of Agents.md.
class _CornerUtilityButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isDestructive;

  const _CornerUtilityButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isDestructive = false,
  });

  @override
  State<_CornerUtilityButton> createState() => _CornerUtilityButtonState();
}

class _CornerUtilityButtonState extends State<_CornerUtilityButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color normalColor =
        widget.isDestructive ? AppColors.darkTextSecondary : AppColors.darkTextSecondary;
    final Color activeColor =
        widget.isDestructive ? const Color(0xFFEF4444) : AppColors.accentOrange;

    final Color effectiveColor = _isHovered ? activeColor : normalColor;
    final Color effectiveBorder = _isHovered
        ? (widget.isDestructive
            ? const Color(0xFFEF4444).withAlpha(180)
            : AppColors.accentOrange.withAlpha(180))
        : AppColors.darkBorderSubtle;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.darkBgSurfaceElevated : AppColors.darkBgSurface,
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(color: effectiveBorder, width: 1.0),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: (widget.isDestructive
                              ? const Color(0xFFEF4444)
                              : AppColors.accentOrange)
                          .withAlpha(50),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 16.0,
                color: effectiveColor,
              ),
              const SizedBox(width: 8.0),
              Text(
                widget.label,
                style: TextStyle(
                  fontFamily: 'SpaceMono',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  color: effectiveColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
