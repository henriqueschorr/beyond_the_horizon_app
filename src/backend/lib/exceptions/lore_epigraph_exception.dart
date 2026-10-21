/// Machine-readable typed exception for universe lore epigraph operations.
/// Error codes allow the frontend controller to map failures strictly to localized telemetry strings.
class LoreEpigraphException implements Exception {
  final String code;
  final String? message;

  const LoreEpigraphException(this.code, [this.message]);

  static const String notFound = 'lore_epigraph_not_found';
  static const String catalogEmpty = 'lore_epigraph_catalog_empty';
  static const String unsupportedLocale = 'lore_epigraph_unsupported_locale';
  static const String operationFailed = 'lore_epigraph_operation_failed';

  @override
  String toString() => 'LoreEpigraphException: $code';
}
