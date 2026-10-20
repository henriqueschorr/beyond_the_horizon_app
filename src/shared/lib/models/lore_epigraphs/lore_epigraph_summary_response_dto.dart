import '../../enums/epigraph_type.dart';

/// Lightweight summary response DTO representing an epigraph in catalog listings.
class LoreEpigraphSummaryResponseDto {
  final String id;
  final EpigraphType type;
  final String preview;
  final String source;
  final String locale;
  final DateTime updatedAt;

  const LoreEpigraphSummaryResponseDto({
    required this.id,
    required this.type,
    required this.preview,
    required this.source,
    required this.locale,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type.toDbString(),
      'preview': preview,
      'source': source,
      'locale': locale,
      'updated_at': updatedAt.toUtc().toIso8601String(),
    };
  }

  factory LoreEpigraphSummaryResponseDto.fromMap(Map<String, dynamic> map) {
    return LoreEpigraphSummaryResponseDto(
      id: map['id'] as String? ?? '',
      type: EpigraphType.fromDbString(map['type'] as String? ?? 'quote'),
      preview: map['preview'] as String? ?? '',
      source: map['source'] as String? ?? '',
      locale: map['locale'] as String? ?? 'pt-BR',
      updatedAt: DateTime.tryParse(map['updated_at'] as String? ?? '')?.toUtc() ??
          DateTime.now().toUtc(),
    );
  }
}
