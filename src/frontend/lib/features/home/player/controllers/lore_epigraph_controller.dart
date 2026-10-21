import 'package:backend/backend.dart';
import 'package:flutter/foundation.dart';
import 'package:shared/shared.dart';

/// Controller managing randomized lore epigraph loading and state for the Player Command Deck.
/// Adheres strictly to Rule 7 and Rule 10 of Agents.md: pure constructor injection, holds state, not futures.
class LoreEpigraphController extends ChangeNotifier {
  final BackendService _backendService;

  LoreEpigraphDetailResponseDto? _epigraph;
  bool _isLoading = false;
  String? _errorMessage;
  String? _errorCode;
  String _currentLocale = 'pt-BR';
  EpigraphType? _currentType;

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
  String? get errorCode => _errorCode;
  bool get hasError => _errorCode != null;

  /// Loads a single randomized lore epigraph for the current locale and optional category filter.
  Future<void> loadRandomEpigraph({
    String locale = 'pt-BR',
    EpigraphType? type,
  }) async {
    _currentLocale = locale;
    _currentType = type;
    _isLoading = true;
    _errorMessage = null;
    _errorCode = null;
    notifyListeners();

    try {
      final request = GetRandomLoreEpigraphRequestDto(
        locale: locale,
        type: type,
      );
      _epigraph = await _backendService.loreEpigraph.getRandomEpigraph(request);
    } on LoreEpigraphException catch (exception) {
      _errorCode = exception.code;
      _errorMessage = exception.message ?? exception.code;
    } catch (error) {
      _errorCode = LoreEpigraphException.operationFailed;
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Triggers a re-scan transmission query using the last active parameters.
  Future<void> refresh() async {
    await loadRandomEpigraph(locale: _currentLocale, type: _currentType);
  }
}
