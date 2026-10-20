import '../../enums/epigraph_type.dart';

/// Full detail response DTO representing a randomized lore epigraph or single article payload.
class LoreEpigraphDetailResponseDto {
  final String id;
  final EpigraphType type;
  final String content;
  final String source;
  final String locale;
  final DateTime createdAt;
  final DateTime updatedAt;

  const LoreEpigraphDetailResponseDto({
    required this.id,
    required this.type,
    required this.content,
    required this.source,
    required this.locale,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type.toDbString(),
      'content': content,
      'source': source,
      'locale': locale,
      'created_at': createdAt.toUtc().toIso8601String(),
      'updated_at': updatedAt.toUtc().toIso8601String(),
    };
  }

  factory LoreEpigraphDetailResponseDto.fromMap(Map<String, dynamic> map) {
    return LoreEpigraphDetailResponseDto(
      id: map['id'] as String? ?? '',
      type: EpigraphType.fromDbString(map['type'] as String? ?? 'quote'),
      content: map['content'] as String? ?? '',
      source: map['source'] as String? ?? '',
      locale: map['locale'] as String? ?? 'pt-BR',
      createdAt: DateTime.tryParse(map['created_at'] as String? ?? '')?.toUtc() ??
          DateTime.now().toUtc(),
      updatedAt: DateTime.tryParse(map['updated_at'] as String? ?? '')?.toUtc() ??
          DateTime.now().toUtc(),
    );
  }
}
