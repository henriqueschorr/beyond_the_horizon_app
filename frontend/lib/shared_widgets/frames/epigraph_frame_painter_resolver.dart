import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../theme/color/app_colors.dart';
import 'document_frame_painter.dart';
import 'news_frame_painter.dart';
import 'poem_quote_frame_painter.dart';
import 'transmission_frame_painter.dart';

/// Resolver service that maps domain EpigraphType to its dedicated CustomPainter.
/// Decouples geometric lore frame shapes so they can be reused across multiple features.
class EpigraphFramePainterResolver {
  const EpigraphFramePainterResolver();

  /// Resolves the appropriate CustomPainter for the given domain EpigraphType.
  CustomPainter resolve(
    EpigraphType type, {
    Color color = AppColors.accentOrange,
  }) {
    switch (type) {
      case EpigraphType.document:
        return DocumentFramePainter(color: color);
      case EpigraphType.news:
        return NewsFramePainter(color: color);
      case EpigraphType.poem:
      case EpigraphType.quote:
        return PoemQuoteFramePainter(color: color);
      case EpigraphType.transmission:
        return TransmissionFramePainter(color: color);
    }
  }

  /// Builds a framed container widget around the child using the resolved silhouette.
  Widget buildFramed({
    required EpigraphType type,
    required Widget child,
    Color color = AppColors.accentOrange,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 22.0),
  }) {
    return CustomPaint(
      painter: resolve(type, color: color),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }

  /// Static helper for immediate resolution without instantiation.
  static CustomPainter resolveStatic(
    EpigraphType type, {
    Color color = AppColors.accentOrange,
  }) {
    const resolver = EpigraphFramePainterResolver();
    return resolver.resolve(type, color: color);
  }

  /// Static helper for building framed containers without instantiation.
  static Widget buildFramedStatic({
    required EpigraphType type,
    required Widget child,
    Color color = AppColors.accentOrange,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 22.0),
  }) {
    const resolver = EpigraphFramePainterResolver();
    return resolver.buildFramed(
      type: type,
      child: child,
      color: color,
      padding: padding,
    );
  }
}
