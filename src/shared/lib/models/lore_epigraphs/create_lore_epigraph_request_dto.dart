import '../../enums/epigraph_type.dart';

/// Request DTO for creating a new lore epigraph and its initial translation.
class CreateLoreEpigraphRequestDto {
  final EpigraphType type;
  final String content;
  final String source;
  final String locale;

  const CreateLoreEpigraphRequestDto({
    required this.type,
    required this.content,
    required this.source,
    this.locale = 'pt-BR',
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type.toDbString(),
      'content': content,
      'source': source,
      'locale': locale,
    };
  }

  factory CreateLoreEpigraphRequestDto.fromMap(Map<String, dynamic> map) {
    return CreateLoreEpigraphRequestDto(
      type: EpigraphType.fromDbString(map['type'] as String? ?? 'quote'),
      content: map['content'] as String? ?? '',
      source: map['source'] as String? ?? '',
      locale: map['locale'] as String? ?? 'pt-BR',
    );
  }
}
