import '../../enums/epigraph_type.dart';

/// Request DTO for updating a lore epigraph and its localized translation.
class UpdateLoreEpigraphRequestDto {
  final EpigraphType? type;
  final String? content;
  final String? source;
  final String locale;

  const UpdateLoreEpigraphRequestDto({
    this.type,
    this.content,
    this.source,
    this.locale = 'pt-BR',
  });

  Map<String, dynamic> toMap() {
    return {
      if (type != null) 'type': type!.toDbString(),
      if (content != null) 'content': content,
      if (source != null) 'source': source,
      'locale': locale,
    };
  }

  factory UpdateLoreEpigraphRequestDto.fromMap(Map<String, dynamic> map) {
    return UpdateLoreEpigraphRequestDto(
      type: map['type'] != null ? EpigraphType.fromDbString(map['type'] as String) : null,
      content: map['content'] as String?,
      source: map['source'] as String?,
      locale: map['locale'] as String? ?? 'pt-BR',
    );
  }
}
