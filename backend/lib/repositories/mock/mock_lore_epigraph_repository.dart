import 'dart:math' as math;
import 'package:shared/shared.dart';
import 'package:uuid/uuid.dart';

import '../lore_epigraph_repository.dart';

/// In-memory mock repository implementing LoreEpigraphRepository with pt-BR seed data.
class MockLoreEpigraphRepository implements LoreEpigraphRepository {
  final Map<String, _MockEpigraphEntry> _entries = {};
  final math.Random _random = math.Random();
  static const Uuid _uuid = Uuid();

  MockLoreEpigraphRepository() {
    _seedInitialData();
  }

  void _seedInitialData() {
    // 1. Document (Classified institutional folio)
    _addEntry(
      id: 'doc-001-epigraph',
      type: EpigraphType.document,
      content:
          'DIRETIVA INSTITUCIONAL // SEÇÃO 09-D\n'
          'Qualquer operador que manifestar ressonância cognitiva após a travessia do limiar de [OMITIDO] deve ser imediatamente contido no setor médico da estação. Não olhe para as fissuras no casco.',
      source: 'Divisão de Segurança Sintética, Protocolo 44',
      locale: 'pt-BR',
    );

    // 2. News (Corporate colony ticker bulletin)
    _addEntry(
      id: 'news-002-epigraph',
      type: EpigraphType.news,
      content:
          'BOLETIM DE COLÔNIA // CICLO SOLAR 412.8\n'
          'O consórcio Weyland-Apex confirmou a paralisação de 30 dias na refinaria de hélio-3 após o desaparecimento de duas equipes de extração na cratera boreal. As buscas continuam.',
      source: 'Agência de Notícias da Borda Exterior',
      locale: 'pt-BR',
    );

    // 3. Poem (Cosmic verse with stanzas)
    _addEntry(
      id: 'poem-003-epigraph',
      type: EpigraphType.poem,
      content:
          'O vácuo não responde quando chamamos.\n'
          'Ele apenas ecoa o que tememos esquecer.\n'
          'Entre as estrelas frias, somos cinza e poeira.\n'
          'E o horizonte nos observa sem pestanejar.',
      source: 'Cantos do Observador Cego, Fragmento VII',
      locale: 'pt-BR',
    );

    // 4. Quote (Philosophical astronaut transmission)
    _addEntry(
      id: 'quote-004-epigraph',
      type: EpigraphType.quote,
      content:
          'Não foi a escuridão do espaço que nos assustou durante o salto gravitacional. Foi perceber que algo na escuridão já nos conhecia pelo nome.',
      source: 'Comandante Elena Vance, Diário de Bordo da USG Meridian',
      locale: 'pt-BR',
    );

    // 5. Transmission (Emergency SOS sensor transcript)
    _addEntry(
      id: 'trans-005-epigraph',
      type: EpigraphType.transmission,
      content:
          '-- INTERCEPTAÇÃO DE SINAL // FREQ 1420.45 MHz --\n'
          'AQUI É O CARGUEIRO OMNIS-9. MOTORES INOPERANTES NO SETOR [OMITIDO].\n'
          'O HORIZONTE ESTÁ SE DOBRANDO SOBRE A PROA. NÃO ENVIEM RESGATE. REPETINDO: [OMITIDO].',
      source: 'Transmissão de Emergência Não Triada, Estação Kepler-8',
      locale: 'pt-BR',
    );
  }

  void _addEntry({
    required String id,
    required EpigraphType type,
    required String content,
    required String source,
    required String locale,
  }) {
    final now = DateTime.now().toUtc();
    _entries[id] = _MockEpigraphEntry(
      id: id,
      type: type,
      content: content,
      source: source,
      locale: locale,
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  Future<LoreEpigraphDetailResponseDto?> getRandomEpigraph(String locale) async {
    final matching = _entries.values
        .where((entry) => entry.locale.toLowerCase() == locale.toLowerCase())
        .toList();

    if (matching.isEmpty) {
      return null;
    }

    final chosen = matching[_random.nextInt(matching.length)];
    return LoreEpigraphDetailResponseDto(
      id: chosen.id,
      type: chosen.type,
      content: chosen.content,
      source: chosen.source,
      locale: chosen.locale,
      createdAt: chosen.createdAt,
      updatedAt: chosen.updatedAt,
    );
  }

  @override
  Future<List<LoreEpigraphSummaryResponseDto>> listEpigraphs(String? type, String locale) async {
    return _entries.values
        .where((entry) {
          final matchesLocale = entry.locale.toLowerCase() == locale.toLowerCase();
          final matchesType = type == null || entry.type.toDbString().toLowerCase() == type.toLowerCase();
          return matchesLocale && matchesType;
        })
        .map((entry) {
          final preview = entry.content.length > 120
              ? '${entry.content.substring(0, 117)}...'
              : entry.content;
          return LoreEpigraphSummaryResponseDto(
            id: entry.id,
            type: entry.type,
            preview: preview,
            source: entry.source,
            locale: entry.locale,
            updatedAt: entry.updatedAt,
          );
        })
        .toList();
  }

  @override
  Future<LoreEpigraphDetailResponseDto?> getEpigraphById(String id, String locale) async {
    final entry = _entries[id];
    if (entry == null || entry.locale.toLowerCase() != locale.toLowerCase()) {
      return null;
    }
    return LoreEpigraphDetailResponseDto(
      id: entry.id,
      type: entry.type,
      content: entry.content,
      source: entry.source,
      locale: entry.locale,
      createdAt: entry.createdAt,
      updatedAt: entry.updatedAt,
    );
  }

  @override
  Future<LoreEpigraphDetailResponseDto> createEpigraph(CreateLoreEpigraphRequestDto request) async {
    final newId = _uuid.v4();
    final now = DateTime.now().toUtc();
    final entry = _MockEpigraphEntry(
      id: newId,
      type: request.type,
      content: request.content,
      source: request.source,
      locale: request.locale,
      createdAt: now,
      updatedAt: now,
    );
    _entries[newId] = entry;

    return LoreEpigraphDetailResponseDto(
      id: entry.id,
      type: entry.type,
      content: entry.content,
      source: entry.source,
      locale: entry.locale,
      createdAt: entry.createdAt,
      updatedAt: entry.updatedAt,
    );
  }

  @override
  Future<LoreEpigraphDetailResponseDto> updateEpigraph(
    String id,
    UpdateLoreEpigraphRequestDto request,
  ) async {
    final existing = _entries[id];
    if (existing == null) {
      throw ArgumentError('Lore epigraph not found with id: $id');
    }

    final updated = existing.copyWith(
      type: request.type,
      content: request.content,
      source: request.source,
      locale: request.locale,
      updatedAt: DateTime.now().toUtc(),
    );
    _entries[id] = updated;

    return LoreEpigraphDetailResponseDto(
      id: updated.id,
      type: updated.type,
      content: updated.content,
      source: updated.source,
      locale: updated.locale,
      createdAt: updated.createdAt,
      updatedAt: updated.updatedAt,
    );
  }

  @override
  Future<void> deleteEpigraph(String id) async {
    _entries.remove(id);
  }
}

class _MockEpigraphEntry {
  final String id;
  final EpigraphType type;
  final String content;
  final String source;
  final String locale;
  final DateTime createdAt;
  final DateTime updatedAt;

  const _MockEpigraphEntry({
    required this.id,
    required this.type,
    required this.content,
    required this.source,
    required this.locale,
    required this.createdAt,
    required this.updatedAt,
  });

  _MockEpigraphEntry copyWith({
    EpigraphType? type,
    String? content,
    String? source,
    String? locale,
    DateTime? updatedAt,
  }) {
    return _MockEpigraphEntry(
      id: id,
      type: type ?? this.type,
      content: content ?? this.content,
      source: source ?? this.source,
      locale: locale ?? this.locale,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
