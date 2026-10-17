import 'package:flutter/material.dart';
import '../../../core/service_locator.dart';
import '../../../shared_widgets/buttons/brutalist_segmented_toggle.dart';
import '../../../theme/color/app_colors.dart';
import '../../../theme/typograph/semantic_text_widgets.dart';
import '../controllers/settings_controller.dart';
import '../../../l10n/app_localizations.dart';

/// Terminal settings drawer providing preference controls.
/// Enforces Rule 10 of Agents.md: StatelessWidget with constructor initializer resolution.
class TerminalSettingsDrawer extends StatelessWidget {
  final SettingsController settingsController;

  TerminalSettingsDrawer({
    super.key,
    SettingsController? settingsController,
  }) : settingsController =
            settingsController ?? serviceLocator<SettingsController>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Drawer(
      backgroundColor: AppColors.darkBgSurface,
      elevation: 16.0,
      shape: const RoundedRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(
              color: AppColors.darkBorderProminent,
              width: 1.0,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListenableBuilder(
              listenable: settingsController,
              builder: (context, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Telemetry Header
                    FieldLabelHighlightedText(l10n.settings.telemetryHeader),
                    const SizedBox(height: 8.0),

                    // Header Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DisplayTitleText(l10n.settings.title),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: AppColors.darkBgSurfaceElevated,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  color: AppColors.darkBorderProminent,
                                  width: 1.0,
                                ),
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 18.0,
                                color: AppColors.darkTextPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),

                    // Hairline Divider
                    Container(
                      height: 1.0,
                      color: AppColors.darkBorderSubtle,
                    ),
                    const SizedBox(height: 24.0),

                    // Section: 01 DISPLAY & MATERIALITY
                    FieldLabelMutedText(l10n.settings.displaySection),
                    const SizedBox(height: 12.0),

                    // Noise Setting Card
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: AppColors.darkBgCanvas,
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: AppColors.darkBorderProminent,
                          width: 1.2,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ActionLabelText(l10n.settings.noiseTitle),
                                const SizedBox(height: 4.0),
                                LegendText(l10n.settings.noiseDescription),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          BrutalistSegmentedToggle(
                            value: settingsController.isNoiseEnabled,
                            onChanged: (enabled) =>
                                settingsController.setNoiseEnabled(enabled),
                            onLabel: l10n.settings.toggleOn,
                            offLabel: l10n.settings.toggleOff,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
