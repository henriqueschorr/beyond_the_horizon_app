import 'package:flutter/material.dart';
import '../../../theme/color/app_colors.dart';
import '../../../theme/typograph/semantic_text_widgets.dart';
import '../controllers/settings_controller.dart';
import '../../../l10n/app_localizations.dart';

/// Terminal settings drawer providing preference controls.
/// Enforces Rule 10 of Agents.md: StatelessWidget with constructor initializer resolution.
class TerminalSettingsDrawer extends StatelessWidget {
  final SettingsController? settingsController;

  const TerminalSettingsDrawer({
    super.key,
    this.settingsController,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Drawer(
      backgroundColor: AppColors.darkBgSurface,
      elevation: 16.0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DisplayTitleText(l10n.settings.title),
                  IconButton(
                    icon: const Icon(Icons.close, color: AppColors.darkTextPrimary),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),

              // Divider
              Container(
                height: 1.0,
                color: AppColors.darkBorderSubtle,
              ),
              const SizedBox(height: 24.0),

              // Empty Preferences Notice
              LegendText(l10n.settings.noOptionsNotice),
            ],
          ),
        ),
      ),
    );
  }
}
