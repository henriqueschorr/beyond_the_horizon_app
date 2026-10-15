import 'package:shared/shared.dart';
import '../repositories/lore_epigraph_repository.dart';

/// Domain service managing lore epigraph operations and retrieval.
class LoreEpigraphService {
  final LoreEpigraphRepository _loreEpigraphRepository;

  LoreEpigraphService({
    required LoreEpigraphRepository loreEpigraphRepository,
  }) : _loreEpigraphRepository = loreEpigraphRepository;

  /// Resolves a single randomized lore epigraph detail record for the Command Deck.
  Future<LoreEpigraphDetailResponseDto?> getRandomEpigraph({String locale = 'pt-BR'}) async {
    return await _loreEpigraphRepository.getRandomEpigraph(locale);
  }

  /// Lists lightweight epigraph summaries filtered by optional type and locale for administration.
  Future<List<LoreEpigraphSummaryResponseDto>> listEpigraphs({
    String? type,
    String locale = 'pt-BR',
  }) async {
    return await _loreEpigraphRepository.listEpigraphs(type, locale);
  }

  /// Retrieves a single epigraph detail record by ID and locale.
  Future<LoreEpigraphDetailResponseDto?> getEpigraphById(
    String id, {
    String locale = 'pt-BR',
  }) async {
    if (id.trim().isEmpty) return null;
    return await _loreEpigraphRepository.getEpigraphById(id, locale);
  }

  /// Inserts a new base epigraph and its localized translation.
  Future<LoreEpigraphDetailResponseDto> createEpigraph(CreateLoreEpigraphRequestDto request) async {
    return await _loreEpigraphRepository.createEpigraph(request);
  }

  /// Modifies an epigraph or its localized translation.
  Future<LoreEpigraphDetailResponseDto> updateEpigraph(
    String id,
    UpdateLoreEpigraphRequestDto request,
  ) async {
    return await _loreEpigraphRepository.updateEpigraph(id, request);
  }

  /// Removes an epigraph by ID.
  Future<void> deleteEpigraph(String id) async {
    return await _loreEpigraphRepository.deleteEpigraph(id);
  }
}
