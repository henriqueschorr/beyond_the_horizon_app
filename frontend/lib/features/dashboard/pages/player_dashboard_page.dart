import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../auth/controllers/auth_controller.dart';
import '../../../core/service_locator.dart';
import '../../../theme/shaders/crt_surface.dart';
import '../../../theme/shaders/grain_surface.dart';
import '../../../theme/shaders/star_surface.dart';
import '../../../theme/color/app_colors.dart';
import '../../../theme/typograph/app_typography.dart';
import '../../../theme/typograph/semantic_text_widgets.dart';
import '../../home/widgets/crossword_brand_mark.dart';
import '../../home/widgets/responsive_telemetry_guard.dart';
import '../../settings/controllers/settings_controller.dart';
import '../../settings/widgets/terminal_settings_drawer.dart';
import '../../../l10n/app_localizations.dart';

/// Logged-In Player Dashboard (Command Deck) specified in SDD 04 Section 7.
/// Crossword brand mark docked in left third, direct welcome banner, and 5 prioritized feature launchers.
class PlayerDashboardPage extends StatelessWidget {
  final AuthController authController;
  final SettingsController settingsController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PlayerDashboardPage({
    super.key,
    AuthController? authController,
    SettingsController? settingsController,
  })  : authController = authController ?? serviceLocator<AuthController>(),
        settingsController = settingsController ?? serviceLocator<SettingsController>();

  void _openSettings() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  Future<void> _handleSignOut(BuildContext context) async {
    await authController.signOut();
    if (context.mounted) {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                child: ListenableBuilder(
                  listenable: authController,
                  builder: (context, _) {
                    final l10n = AppLocalizations.of(context)!;
                    final operativeName = authController.currentUser?.displayName ?? l10n.common.operative;

                    return Row(
                      children: [
                        // Left Third: Glided Crossword Brand Mark & Horizon Dock
                        Container(
                          width: 440.0,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(color: AppColors.darkBorderSubtle, width: 1.0),
                            ),
                          ),
                          child: Center(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: CrosswordBrandMark(
                                  scale: 0.65,
                                  showSubmergedLetters: true,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Right Side: Command Deck
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Direct Welcome Greeting (SDD 04 Section 7.2)
                                DisplayTitleLargeText(
                                  l10n.dashboard.welcome(operativeName.toUpperCase()),
                                ),
                                const SizedBox(height: 8.0),
                                TacticalLabelSmallHighlightedText(
                                  l10n.dashboard.status,
                                ),

                                const SizedBox(height: 36.0),

                                // Five Prioritized Feature Buttons
                                Expanded(
                                  child: ListView(
                                    children: [
                                      // 1. Jogar Personagem
                                      _FeatureLauncherTile(
                                        icon: Icons.sports_esports_outlined,
                                        title: l10n.dashboard.playCharacterTitle,
                                        subtitle: l10n.dashboard.playCharacterSubtitle,
                                        onTap: () => context.go('/in-construction?module=${Uri.encodeComponent(l10n.dashboard.playCharacterTitle)}'),
                                      ),
                                      const SizedBox(height: 12.0),

                                      // 2. Criar Personagem
                                      _FeatureLauncherTile(
                                        icon: Icons.person_add_alt_1_outlined,
                                        title: l10n.dashboard.createCharacterTitle,
                                        subtitle: l10n.dashboard.createCharacterSubtitle,
                                        onTap: () => context.go('/in-construction?module=${Uri.encodeComponent(l10n.dashboard.createCharacterTitle)}'),
                                      ),
                                      const SizedBox(height: 12.0),

                                      // 3. Compêndio
                                      _FeatureLauncherTile(
                                        icon: Icons.menu_book_outlined,
                                        title: l10n.dashboard.compendiumTitle,
                                        subtitle: l10n.dashboard.compendiumSubtitle,
                                        onTap: () => context.go('/in-construction?module=${Uri.encodeComponent(l10n.dashboard.compendiumTitle)}'),
                                      ),
                                      const SizedBox(height: 12.0),

                                      // 4. Configurações
                                      _FeatureLauncherTile(
                                        icon: Icons.settings_outlined,
                                        title: l10n.dashboard.settingsTitle,
                                        subtitle: l10n.dashboard.settingsSubtitle,
                                        onTap: _openSettings,
                                      ),
                                      const SizedBox(height: 12.0),

                                      // 5. Sair
                                      _FeatureLauncherTile(
                                        icon: Icons.logout_outlined,
                                        title: l10n.dashboard.signOutTitle,
                                        subtitle: l10n.dashboard.signOutSubtitle,
                                        isDestructive: true,
                                        onTap: () => _handleSignOut(context),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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

class _FeatureLauncherTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isDestructive;

  const _FeatureLauncherTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  State<_FeatureLauncherTile> createState() => _FeatureLauncherTileState();
}

class _FeatureLauncherTileState extends State<_FeatureLauncherTile> {
  bool _isHovered = false;

  void _handleHover(bool hovering) {
    if (_isHovered != hovering) {
      setState(() => _isHovered = hovering);
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _isHovered
        ? (widget.isDestructive ? const Color(0xFFDC2626) : AppColors.accentOrange)
        : AppColors.darkBorderSubtle;

    final iconColor = _isHovered
        ? (widget.isDestructive ? const Color(0xFFDC2626) : AppColors.accentOrange)
        : AppColors.darkTextPrimary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? 1.01 : 1.0,
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOutCubic,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkBgSurface,
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(color: borderColor, width: 1.0),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: (widget.isDestructive ? const Color(0xFFDC2626) : AppColors.accentOrange)
                            .withValues(alpha: 0.16),
                        blurRadius: 10.0,
                        offset: const Offset(0, 2),
                      )
                    ]
                  : null,
            ),
            child: GrainSurface(
              tintColor: _isHovered ? AppColors.accentOrange : null,
              intensity: _isHovered ? 1.2 : 0.8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                child: Row(
                children: [
                  // Rounded-square icon badge with GrainSurface
                  Container(
                    width: 44.0,
                    height: 44.0,
                    decoration: BoxDecoration(
                      color: AppColors.darkBgSurfaceElevated,
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(color: borderColor, width: 1.0),
                    ),
                    child: Center(
                      child: Icon(widget.icon, size: 22.0, color: iconColor),
                    ),
                  ),
                  const SizedBox(width: 20.0),

                  // Feature Text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: AppTypography.actionLabel.copyWith(
                            color: _isHovered ? AppColors.darkTextPrimary : AppColors.darkTextSecondary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          widget.subtitle,
                          style: AppTypography.legend,
                        ),
                      ],
                    ),
                  ),

                  // Chevron indicator
                  Icon(
                    Icons.chevron_right,
                    size: 20.0,
                    color: _isHovered ? AppColors.accentOrange : AppColors.darkTextMuted,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
}
