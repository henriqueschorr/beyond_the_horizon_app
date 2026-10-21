import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../shared_widgets/frames/epigraph_frame_painter_resolver.dart';
import '../../../../shared_widgets/frames/transmission_frame_painter.dart';
import '../../../../theme/color/app_colors.dart';
import '../../../../theme/typograph/semantic_text_widgets.dart';
import '../../../dynamic_text/widgets/dynamic_text.dart';
import '../controllers/lore_epigraph_controller.dart';

/// Middle-right randomized lore epigraph box adhering to SDD 04 Section 7.3.
/// Features four pure geometric framing silhouettes resolved via EpigraphFramePainterResolver.
/// - Dynamic width tailoring: 360px for EpigraphType.document (vertical A4 folio), 420px for others.
/// - Epigraph content renders via DynamicText in Space Mono (bodyMono).
/// - Attribution source is right-aligned outside the frame beneath content in Space Mono (bodyMono).
/// - Top-right minimal rotating refresh actuator.
/// - In-universe signal loss error boundary.
class LoreEpigraphBox extends StatelessWidget {
  final LoreEpigraphController controller;
  final double width;
  final EpigraphFramePainterResolver frameResolver;

  const LoreEpigraphBox({
    super.key,
    required this.controller,
    this.width = 420.0,
    this.frameResolver = const EpigraphFramePainterResolver(),
  });

  double _resolveWidth(EpigraphType type) {
    switch (type) {
      case EpigraphType.document:
        return 360.0;
      case EpigraphType.news:
      case EpigraphType.poem:
      case EpigraphType.quote:
      case EpigraphType.transmission:
        return width;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final epigraph = controller.epigraph;
        final isLoading = controller.isLoading;
        final hasError = controller.hasError;

        if (isLoading && epigraph == null) {
          return SizedBox(
            width: width,
            height: 180.0,
            child: Center(
              child: FieldLabelMutedText(l10n.lore.decryptingTransmission),
            ),
          );
        }

        if (hasError || epigraph == null) {
          return LoreErrorPanel(
            controller: controller,
            width: width,
          );
        }

        final targetWidth = _resolveWidth(epigraph.type);

        return SizedBox(
          width: targetWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top-Right Minimal Refresh Actuator Outside Frame
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0, right: 2.0),
                  child: LoreRefreshActuator(
                    isLoading: isLoading,
                    tooltip: l10n.lore.rescanTooltip,
                    onPressed: () => controller.refresh(),
                  ),
                ),
              ),

              // 1. Geometric Framed Lore Narrative Core
              frameResolver.buildFramed(
                type: epigraph.type,
                child: DynamicText(epigraph.content),
              ),

              const SizedBox(height: 12.0),

              // 2. Right-Aligned Source Attribution Outside Frame
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: BodyMonoText(
                    '— ${epigraph.source}',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Minimalist rotating tactile refresh actuator anchored at the top-right corner.
class LoreRefreshActuator extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final String tooltip;

  const LoreRefreshActuator({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.tooltip,
  });

  @override
  State<LoreRefreshActuator> createState() => _LoreRefreshActuatorState();
}

class _LoreRefreshActuatorState extends State<LoreRefreshActuator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotationController;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    if (widget.isLoading) {
      _rotationController.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant LoreRefreshActuator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading && !oldWidget.isLoading) {
      _rotationController.repeat();
    } else if (!widget.isLoading && oldWidget.isLoading) {
      _rotationController.stop();
      _rotationController.reset();
    }
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.isLoading ? null : widget.onPressed,
          child: RotationTransition(
            turns: _rotationController,
            child: Icon(
              Icons.sync,
              size: 15.0,
              color: _isHovered
                  ? AppColors.accentOrange
                  : AppColors.darkTextMuted,
            ),
          ),
        ),
      ),
    );
  }
}

/// In-universe tactical signal loss error boundary panel.
class LoreErrorPanel extends StatelessWidget {
  final LoreEpigraphController controller;
  final double width;

  const LoreErrorPanel({
    super.key,
    required this.controller,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final errorCode = controller.errorCode ?? 'SIGNAL_LOST';

    return SizedBox(
      width: width,
      child: CustomPaint(
        painter: const TransmissionFramePainter(
          color: AppColors.darkBorderSubtle,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 22.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldLabelMutedText(l10n.lore.signalInterrupted),
              const SizedBox(height: 6.0),
              BodyMonoText('// ERR: $errorCode'),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => controller.refresh(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14.0,
                        vertical: 6.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.accentOrange,
                          width: 1.0,
                        ),
                      ),
                      child: ActionLabelSmallHighlightedText(
                        '[ ${l10n.lore.retryAction} ]',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
