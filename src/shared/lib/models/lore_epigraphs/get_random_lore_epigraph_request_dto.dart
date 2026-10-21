import '../../enums/epigraph_type.dart';

/// Request DTO for resolving a randomized universe lore epigraph.
/// Pure serialization wire contract supporting optional locale and category filtering.
class GetRandomLoreEpigraphRequestDto {
  final String locale;
  final EpigraphType? type;

  const GetRandomLoreEpigraphRequestDto({
    this.locale = 'pt-BR',
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'locale': locale,
      if (type != null) 'type': type!.toDbString(),
    };
  }

  factory GetRandomLoreEpigraphRequestDto.fromMap(Map<String, dynamic> map) {
    return GetRandomLoreEpigraphRequestDto(
      locale: map['locale'] as String? ?? 'pt-BR',
      type: map['type'] != null
          ? EpigraphType.fromDbString(map['type'] as String)
          : null,
    );
  }
}
