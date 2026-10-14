import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../l10n/app_localizations.dart';
import '../../../shared_widgets/icons/d6_die_icon.dart';
import '../../../theme/color/app_colors.dart';
import '../../../theme/shaders/grain_surface.dart';
import '../../../theme/typograph/semantic_text_widgets.dart';

/// Monumental 3-card triptych navigation menu for the Authenticated Home Command Deck.
/// Implements Minimalist Brutalism and Cassette-Futurism aesthetics with
/// carved-down recessed icon wells, horizontal rocker-switch pill lamps,
/// and procedural analog noise materiality (GrainSurface).
class PlayerMenuCards extends StatelessWidget {
  final bool hasActiveCharacter;
  final VoidCallback? onPlayFallback;

  const PlayerMenuCards({
    super.key,
    this.hasActiveCharacter = false,
    this.onPlayFallback,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CARD 1: Play with Character
            _TriptychCard(
              sectionCode: '// SEC-01',
              title: l10n.dashboard.playCharacterTitle,
              icon: const D6DieIcon(size: 52.0),
              isRockerLampActive: hasActiveCharacter,
              statusTag: hasActiveCharacter
                  ? '[ ${l10n.dashboard.statusReady} ]'
                  : '[ ${l10n.dashboard.statusUninitialized} ]',
              isEnabled: true,
              onTap: () {
                if (hasActiveCharacter) {
                  context.go(
                    '/in-construction?module=${Uri.encodeComponent(l10n.dashboard.playCharacterTitle)}',
                  );
                } else if (onPlayFallback != null) {
                  onPlayFallback!();
                } else {
                  context.go(
                    '/in-construction?module=${Uri.encodeComponent(l10n.dashboard.createCharacterTitle)}',
                  );
                }
              },
            ),

            const SizedBox(width: 16.0),

            // CARD 2: Create Character
            _TriptychCard(
              sectionCode: '// SEC-02',
              title: l10n.dashboard.createCharacterTitle,
              icon: const Icon(
                Icons.person_add_alt_1_outlined,
                size: 52.0,
                color: AppColors.darkTextPrimary,
              ),
              isRockerLampActive: true,
              statusTag: '[ ${l10n.dashboard.statusReady} ]',
              isEnabled: true,
              onTap: () {
                context.go(
                  '/in-construction?module=${Uri.encodeComponent(l10n.dashboard.createCharacterTitle)}',
                );
              },
            ),

            const SizedBox(width: 16.0),

            // CARD 3: Compendium
            _TriptychCard(
              sectionCode: '// SEC-03',
              title: l10n.dashboard.compendiumTitle,
              icon: const Icon(
                Icons.menu_book_outlined,
                size: 52.0,
                color: AppColors.darkTextPrimary,
              ),
              isRockerLampActive: true,
              statusTag: '[ ${l10n.dashboard.statusReady} ]',
              isEnabled: true,
              onTap: () {
                context.go(
                  '/in-construction?module=${Uri.encodeComponent(l10n.dashboard.compendiumTitle)}',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Standalone Brutalist Portrait Card adhering strictly to Rule 8 of Agents.md.
class _TriptychCard extends StatefulWidget {
  final String sectionCode;
  final String title;
  final Widget icon;
  final bool isRockerLampActive;
  final String statusTag;
  final bool isEnabled;
  final VoidCallback onTap;

  const _TriptychCard({
    required this.sectionCode,
    required this.title,
    required this.icon,
    required this.isRockerLampActive,
    required this.statusTag,
    required this.isEnabled,
    required this.onTap,
  });

  @override
  State<_TriptychCard> createState() => _TriptychCardState();
}

class _TriptychCardState extends State<_TriptychCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 240.0;
    const double cardHeight = 350.0;

    final borderColor = _isHovered
        ? AppColors.accentOrange
        : (widget.isEnabled ? AppColors.darkBorderSubtle : AppColors.darkBorderSubtle);

    final cardBgColor = _isHovered
        ? AppColors.darkBgSurfaceElevated
        : AppColors.darkBgSurface;

    return MouseRegion(
      cursor: widget.isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) {
        if (widget.isEnabled) setState(() => _isHovered = true);
      },
      onExit: (_) {
        if (widget.isEnabled) setState(() => _isHovered = false);
      },
      child: GestureDetector(
        onTap: widget.isEnabled ? widget.onTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            color: cardBgColor,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: borderColor,
              width: _isHovered ? 1.5 : 1.0,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9.0),
            child: Stack(
              children: [
                // Hairline technical corner brackets
                Positioned(
                  top: 8.0,
                  left: 10.0,
                  child: TacticalLabelSmallText(
                    widget.sectionCode,
                  ),
                ),

                // Top-right rocker-switch LED lamp
                Positioned(
                  top: 10.0,
                  right: 12.0,
                  child: _RockerSwitchLamp(
                    isActive: widget.isRockerLampActive,
                  ),
                ),

                // Main card content column
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Spacer(),

                      // Carved-down recessed well with analog noise toner
                      Center(
                        child: _CarvedIconBay(
                          icon: widget.icon,
                          isHovered: _isHovered,
                          isActive: widget.isRockerLampActive,
                        ),
                      ),

                      const Spacer(),

                      // Card Action Title
                      Center(
                        child: BodyMediumText(
                          widget.title,
                        ),
                      ),

                      const SizedBox(height: 12.0),

                      // Status pill tag & micro serial
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TacticalLabelSmallText(
                            widget.statusTag,
                          ),
                          const TacticalLabelSmallText(
                            'SYS-READY',
                          ),
                        ],
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

/// Carved-down recessed icon bay with analog toner noise and beveled shadow.
class _CarvedIconBay extends StatelessWidget {
  final Widget icon;
  final bool isHovered;
  final bool isActive;

  const _CarvedIconBay({
    required this.icon,
    required this.isHovered,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    const double baySize = 100.0;

    return Container(
      width: baySize,
      height: baySize,
      decoration: BoxDecoration(
        color: AppColors.darkBgWell,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: isHovered
              ? AppColors.accentOrange
              : AppColors.darkBorderSubtle,
          width: 1.0,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.darkBgWell,
            blurRadius: 8.0,
            spreadRadius: -2.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7.0),
        child: GrainSurface(
          intensity: 0.12,
          child: Center(
            child: Opacity(
              opacity: isActive ? 1.0 : 0.40,
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}

/// Cassette-futurism horizontal rocker-switch pill lamp.
class _RockerSwitchLamp extends StatelessWidget {
  final bool isActive;

  const _RockerSwitchLamp({
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    const double lampWidth = 26.0;
    const double lampHeight = 9.0;

    final lampColor = isActive ? AppColors.accentOrange : AppColors.darkBorderProminent;

    return Container(
      width: lampWidth,
      height: lampHeight,
      decoration: BoxDecoration(
        color: lampColor,
        borderRadius: BorderRadius.circular(4.5),
      ),
    );
  }
}
