import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../shared_widgets/frames/epigraph_frame_painter_resolver.dart';
import '../../../../theme/typograph/semantic_text_widgets.dart';
import '../../../dynamic_text/widgets/dynamic_text.dart';
import '../controllers/lore_epigraph_controller.dart';

/// Middle-right randomized lore epigraph box adhering to SDD 04 Section 7.3.
/// Features four pure geometric framing silhouettes resolved via EpigraphFramePainterResolver.
/// - Epigraph content renders via DynamicText in Space Mono (bodyMono).
/// - Attribution source is right-aligned outside the frame beneath content in Space Mono (bodyMono).
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final epigraph = controller.epigraph;
        final isLoading = controller.isLoading;

        if (isLoading) {
          return SizedBox(
            width: width,
            height: 180.0,
            child: Center(
              child: FieldLabelMutedText(l10n.lore.decryptingTransmission),
            ),
          );
        }

        if (epigraph == null) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                  child: BodyMonoText('— ${epigraph.source}'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
