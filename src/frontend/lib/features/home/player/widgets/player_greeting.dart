import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../theme/typograph/semantic_text_widgets.dart';

/// Top-right player greeting widget adhering to SDD 04 Section 7.4.
/// Displays "Welcome, [Callsign]" with the callsign highlighted in Cassette 90 Vibrant Orange.
class PlayerGreeting extends StatelessWidget {
  final String callsign;

  const PlayerGreeting({
    super.key,
    required this.callsign,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        DisplayTitleText(l10n.dashboard.welcomePrefix),
        const SizedBox(width: 6.0),
        DisplayTitleHighlightedText(callsign),
      ],
    );
  }
}
