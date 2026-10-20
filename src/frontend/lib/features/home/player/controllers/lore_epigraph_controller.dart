import 'package:backend/backend.dart';
import 'package:flutter/foundation.dart';
import 'package:shared/shared.dart';

/// Controller managing randomized lore epigraph loading and state for the Player Command Deck.
/// Adheres strictly to Rule 10 of Agents.md: pure constructor injection, holds state, not futures.
class LoreEpigraphController extends ChangeNotifier {
  final BackendService _backendService;

  LoreEpigraphDetailResponseDto? _epigraph;
  bool _isLoading = false;
  String? _errorMessage;

  LoreEpigraphController({
    required BackendService backendService,
    bool autoLoad = true,
  }) : _backendService = backendService {
    if (autoLoad) {
      loadRandomEpigraph();
    }
  }

  LoreEpigraphDetailResponseDto? get epigraph => _epigraph;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Loads a single randomized lore epigraph for the current locale.
  Future<void> loadRandomEpigraph({String locale = 'pt-BR'}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _epigraph = await _backendService.loreEpigraph.getRandomEpigraph(locale: locale);
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
