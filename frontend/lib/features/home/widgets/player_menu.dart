import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../l10n/app_localizations.dart';
import '../../../shared_widgets/icons/d6_die_icon.dart';
import '../../../shared_widgets/navigation/navigation_menu.dart';

/// Role-specific navigation menu for Operatives/Players specified in SDD 04 Section 7.2.
/// Features 5 connected actions with bespoke D6 tabletop die, character creation,
/// compendium, terminal settings, and session termination.
class PlayerMenu extends StatelessWidget {
  final VoidCallback onOpenSettings;
  final VoidCallback onSignOut;

  const PlayerMenu({
    super.key,
    required this.onOpenSettings,
    required this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final menuItems = [
      MenuItemData(
        icon: const D6DieIcon(size: 20.0),
        label: l10n.dashboard.playCharacterTitle,
        onTap: () {
          context.go('/in-construction?module=${Uri.encodeComponent(l10n.dashboard.playCharacterTitle)}');
        },
      ),
      MenuItemData(
        icon: const Icon(Icons.person_add_alt_1_outlined),
        label: l10n.dashboard.createCharacterTitle,
        onTap: () {
          context.go('/in-construction?module=${Uri.encodeComponent(l10n.dashboard.createCharacterTitle)}');
        },
      ),
      MenuItemData(
        icon: const Icon(Icons.menu_book_outlined),
        label: l10n.dashboard.compendiumTitle,
        onTap: () {
          context.go('/in-construction?module=${Uri.encodeComponent(l10n.dashboard.compendiumTitle)}');
        },
      ),
      MenuItemData(
        icon: const Icon(Icons.settings_outlined),
        label: l10n.dashboard.settingsTitle,
        onTap: onOpenSettings,
      ),
      MenuItemData(
        icon: const Icon(Icons.logout_outlined),
        label: l10n.dashboard.signOutTitle,
        isDestructive: true,
        onTap: onSignOut,
      ),
    ];

    return NavigationMenu(
      items: menuItems,
      isConnected: true,
    );
  }
}
