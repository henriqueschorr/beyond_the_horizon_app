import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../theme/shaders/star_surface.dart';
import '../../../theme/color/app_colors.dart';
import '../../../theme/typograph/semantic_text_widgets.dart';
import '../../../shared_widgets/buttons/tactical_action_button.dart';
import '../../../l10n/app_localizations.dart';

/// Atmospheric in-construction page for features under active development.
/// Features terminal diagnostics, hazard styling, and a return action.
class InConstructionPage extends StatelessWidget {
  final String? moduleName;

  const InConstructionPage({
    super.key,
    this.moduleName,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final displayModule = (moduleName != null && moduleName!.trim().isNotEmpty)
        ? moduleName!.toUpperCase()
        : l10n.inConstruction.header;

    return Scaffold(
      backgroundColor: AppColors.darkBgCanvas,
      body: StarSurface(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 580.0),
              padding: const EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                color: AppColors.darkBgSurface,
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(color: AppColors.accentOrange, width: 1.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentOrange.withValues(alpha: 0.18),
                    blurRadius: 20.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Telemetry Status Header
                  Row(
                    children: [
                      Container(
                        width: 8.0,
                        height: 8.0,
                        decoration: const BoxDecoration(
                          color: AppColors.accentOrange,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      TacticalLabelSmallHighlightedText(
                        l10n.inConstruction.header,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Module Title
                  DisplayTitleLargeText(
                    displayModule,
                  ),
                  const SizedBox(height: 12.0),

                  // Atmospheric Lore Prose
                  BodyProseText(
                    l10n.inConstruction.notice,
                  ),
                  const SizedBox(height: 24.0),

                  // Diagnostic Terminal Block
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: AppColors.darkBgWell,
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: AppColors.darkBorderSubtle),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LegendHighlightedText(
                          l10n.inConstruction.statusCode,
                        ),
                        const SizedBox(height: 6.0),
                        LegendText(
                          l10n.inConstruction.protocol,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28.0),

                  // Action Buttons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TacticalActionButton(
                        label: l10n.inConstruction.returnAction,
                        onPressed: () {
                          if (context.canPop()) {
                            context.pop();
                          } else {
                            context.go('/');
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
