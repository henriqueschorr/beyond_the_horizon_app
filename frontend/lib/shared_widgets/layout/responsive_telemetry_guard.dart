import 'package:flutter/material.dart';
import '../../theme/shaders/star_surface.dart';
import '../../theme/color/app_colors.dart';
import '../../theme/typograph/semantic_text_widgets.dart';
import '../../l10n/app_localizations.dart';

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
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.warning_amber_rounded,
                        color: AppColors.accentOrange,
                        size: 24.0,
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: FieldLabelHighlightedText(
                          l10n.telemetry.resolutionTitle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  BodyProseText(
                    l10n.telemetry.resolutionMessage,
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: AppColors.darkBgWell,
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: AppColors.darkBorderSubtle),
                    ),
                    child: LegendText(
                      l10n.telemetry.connectInstruction,
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
