import 'package:flutter/material.dart';
import '../../../theme/shaders/star_surface.dart';
import '../../../theme/color/app_colors.dart';
import '../../../theme/typograph/semantic_text_widgets.dart';
import '../../../l10n/app_localizations.dart';

/// Responsive telemetry barrier enforcing Phase 1 screen boundaries (SDD 04 Section 2.3).
/// Displays an atmospheric terminal notice for viewports below 768px width.
class ResponsiveTelemetryGuard extends StatelessWidget {
  final Widget child;

  const ResponsiveTelemetryGuard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768.0) {
          return const _MobileTelemetryWarningView();
        }
        return child;
      },
    );
  }
}

class _MobileTelemetryWarningView extends StatelessWidget {
  const _MobileTelemetryWarningView();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.darkBgCanvas,
      body: StarSurface(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 480.0),
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: AppColors.darkBgSurface,
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(color: AppColors.accentOrange, width: 1.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentOrange.withValues(alpha: 0.15),
                    blurRadius: 16.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status code header
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
                        l10n.telemetry.signalWarning,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Warning Title
                  DisplayTitleText(
                    l10n.telemetry.resolutionTitle,
                  ),
                  const SizedBox(height: 12.0),

                  // Prose warning message
                  BodyProseText(
                    l10n.telemetry.resolutionMessage,
                  ),
                  const SizedBox(height: 20.0),

                  // Diagnostic block
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: AppColors.darkBgWell,
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: AppColors.darkBorderSubtle),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LegendHighlightedText(
                          l10n.telemetry.errorCode,
                        ),
                        const SizedBox(height: 4.0),
                        LegendText(
                          l10n.telemetry.connectInstruction,
                        ),
                      ],
                    ),
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
