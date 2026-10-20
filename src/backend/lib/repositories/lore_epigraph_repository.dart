import 'package:shared/shared.dart';

/// Repository interface managing universe lore epigraphs and translations.
abstract class LoreEpigraphRepository {
  /// Resolves a single randomized lore epigraph matching the requested locale.
  Future<LoreEpigraphDetailResponseDto?> getRandomEpigraph(String locale);

  /// Lists lightweight epigraph summaries filtered by optional type and locale.
  Future<List<LoreEpigraphSummaryResponseDto>> listEpigraphs(String? type, String locale);

  /// Retrieves a single epigraph detail record by ID and locale.
  Future<LoreEpigraphDetailResponseDto?> getEpigraphById(String id, String locale);

  /// Inserts a new base epigraph and localized translation.
  Future<LoreEpigraphDetailResponseDto> createEpigraph(CreateLoreEpigraphRequestDto request);

  /// Updates an existing epigraph or its localized translation.
  Future<LoreEpigraphDetailResponseDto> updateEpigraph(String id, UpdateLoreEpigraphRequestDto request);

  /// Removes an epigraph and its translations by ID.
  Future<void> deleteEpigraph(String id);
}
