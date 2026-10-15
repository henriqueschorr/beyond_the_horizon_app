/// Represents the thematic classification of universe lore epigraphs.
/// Sorted alphabetically: document, news, poem, quote, transmission.
/// Matches the public.epigraph_type PostgreSQL enum.
enum EpigraphType {
  document,
  news,
  poem,
  quote,
  transmission;

  static EpigraphType fromDbString(String value) {
    switch (value.trim().toLowerCase()) {
      case 'document':
        return EpigraphType.document;
      case 'news':
        return EpigraphType.news;
      case 'poem':
        return EpigraphType.poem;
      case 'quote':
        return EpigraphType.quote;
      case 'transmission':
        return EpigraphType.transmission;
      default:
        throw ArgumentError('Invalid epigraph_type database string: $value');
    }
  }

  String toDbString() {
    switch (this) {
      case EpigraphType.document:
        return 'document';
      case EpigraphType.news:
        return 'news';
      case EpigraphType.poem:
        return 'poem';
      case EpigraphType.quote:
        return 'quote';
      case EpigraphType.transmission:
        return 'transmission';
    }
  }
}
