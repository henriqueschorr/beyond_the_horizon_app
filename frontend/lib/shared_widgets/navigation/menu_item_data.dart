import 'package:flutter/material.dart';

/// Data model representing a single navigation menu action.
class MenuItemData {
  final Widget icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  const MenuItemData({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });
}
