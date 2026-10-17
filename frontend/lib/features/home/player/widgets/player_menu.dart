import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../theme/typograph/semantic_text_widgets.dart';
import '../../widgets/home_menu_item.dart';

/// Middle-left tactical player menu adhering to SDD 04 Section 7.2.
/// Features the telemetry subtitle // BEGIN YOUR JOURNEY and four SL24 data-carrier actions:
/// - 01 // PLAY WITH CHARACTER
/// - 02 // CREATE CHARACTER
/// - 03 // CODEX
/// - 04 // SETTINGS
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

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 520.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Telemetry Subtitle: // BEGIN YOUR JOURNEY (in #FE6403)
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: FieldLabelHighlightedText(l10n.dashboard.subtitleExplore),
              ),

              const SizedBox(height: 24.0),

              // Action 01: PLAY WITH CHARACTER
              HomeMenuItem(
                label: l10n.dashboard.playCharacterTitle,
                onTap: onPlayWithCharacter,
              ),

              const SizedBox(height: 8.0),

              // Action 02: CREATE CHARACTER
              HomeMenuItem(
                label: l10n.dashboard.createCharacterTitle,
                onTap: onCreateCharacter,
              ),

              const SizedBox(height: 8.0),

              // Action 03: CODEX
              HomeMenuItem(
                label: l10n.dashboard.codexTitle,
                onTap: onOpenCodex,
              ),

              const SizedBox(height: 8.0),

              // Action 04: SETTINGS
              HomeMenuItem(
                label: l10n.dashboard.settingsTitle,
                onTap: onOpenSettings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
