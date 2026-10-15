import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../theme/typograph/semantic_text_widgets.dart';
import '../../widgets/home_menu_item.dart';

/// Middle-left tactical player menu adhering to SDD 04 Section 7.2.
/// Features the telemetry subtitle // BEGIN YOUR JOURNEY and four active bracketed options:
/// - [ PLAY WITH CHARACTER ]
/// - [ CREATE CHARACTER ]
/// - [ CODEX ]
/// - [ SETTINGS ]
class PlayerMenu extends StatelessWidget {
  final VoidCallback onPlayWithCharacter;
  final VoidCallback onCreateCharacter;
  final VoidCallback onOpenCodex;
  final VoidCallback onOpenSettings;

  const PlayerMenu({
    super.key,
    required this.onPlayWithCharacter,
    required this.onCreateCharacter,
    required this.onOpenCodex,
    required this.onOpenSettings,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Telemetry Subtitle: // BEGIN YOUR JOURNEY (in #FE6403)
        // Keeps its exact position aligned with the left column
        FieldLabelHighlightedText(l10n.dashboard.subtitleExplore),

        // More space between Telemetry Subtitle and PlayerHomeMenu
        const SizedBox(height: 30.0),

        // PlayerHomeMenu shifted to the right beneath the subtitle
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Action 1: [ PLAY WITH CHARACTER ]
              HomeMenuItem(
                label: l10n.dashboard.playCharacterTitle,
                onTap: onPlayWithCharacter,
              ),

              const SizedBox(height: 12.0),

              // Action 2: [ CREATE CHARACTER ]
              HomeMenuItem(
                label: l10n.dashboard.createCharacterTitle,
                onTap: onCreateCharacter,
              ),

              const SizedBox(height: 12.0),

              // Action 3: [ CODEX ]
              HomeMenuItem(
                label: l10n.dashboard.codexTitle,
                onTap: onOpenCodex,
              ),

              const SizedBox(height: 12.0),

              // Action 4: [ SETTINGS ]
              HomeMenuItem(
                label: l10n.dashboard.settingsTitle,
                onTap: onOpenSettings,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
