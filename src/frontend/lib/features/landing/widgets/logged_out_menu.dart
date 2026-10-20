import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../shared_widgets/navigation/menu_item.dart';

/// Standalone LoggedOutMenu widget providing Codex and Settings navigation items
/// for unauthenticated visitors.
class LoggedOutMenu extends StatelessWidget {
  final VoidCallback onOpenSettings;
  final VoidCallback? onOpenCodex;

  const LoggedOutMenu({
    super.key,
    required this.onOpenSettings,
    this.onOpenCodex,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MenuItem(
          icon: const Icon(Icons.menu_book_outlined),
          label: l10n.dashboard.codexTitle,
          onTap: onOpenCodex ?? () {},
        ),
        const SizedBox(height: 20.0),
        MenuItem(
          icon: const Icon(Icons.settings_outlined),
          label: l10n.dashboard.settingsTitle,
          onTap: onOpenSettings,
        ),
      ],
    );
  }
}
