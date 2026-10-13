import 'package:flutter/material.dart';

import 'connected_menu_item.dart';
import 'menu_item.dart';
import 'menu_item_data.dart';

export 'connected_menu_item.dart';
export 'menu_item.dart';
export 'menu_item_data.dart';

/// Tactical navigation menu orchestrator.
/// Builds either [ConnectedMenuItem] with vertical conduit line segments when [isConnected] is true,
/// or standalone [MenuItem] elements separated by [itemSpacing] when [isConnected] is false.
class NavigationMenu extends StatelessWidget {
  final List<MenuItemData> items;
  final bool isConnected;
  final double itemSpacing;

  const NavigationMenu({
    super.key,
    required this.items,
    this.isConnected = true,
    this.itemSpacing = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    if (isConnected) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < items.length; i++)
            ConnectedMenuItem(
              data: items[i],
              isFirst: i == 0,
              isLast: i == items.length - 1,
            ),
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < items.length; i++) ...[
          if (i > 0) SizedBox(height: itemSpacing),
          MenuItem(
            data: items[i],
          ),
        ],
      ],
    );
  }
}
