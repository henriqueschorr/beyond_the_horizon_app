import 'package:backend/backend.dart' hide serviceLocator;
import 'package:flutter/foundation.dart';
import 'package:shared/shared.dart';

import '../../../core/service_locator.dart';
import '../validators/auth_validator.dart';
import '../../../l10n/app_localizations.dart';

/// State management controller for operative authentication and session lifecycle.
/// Strictly complies with Rule 10 of Agents.md: Holds state, not futures.
class AuthController extends ChangeNotifier {
  final BackendService _backendService;
  final AuthValidator _validator;

  String _email = '';
  String _password = '';
  bool _isLoading = false;
  String? _errorMessage;

  AuthSessionResponseDto? _activeSession;
  UserProfileResponseDto? _currentUser;

  AuthController({
    BackendService? backendService,
    AuthValidator? validator,
  })  : _backendService = backendService ?? serviceLocator<BackendService>(),
        _validator = validator ?? (serviceLocator.isRegistered<AuthValidator>()
            ? serviceLocator<AuthValidator>()
            : const AuthValidator());

  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  AuthSessionResponseDto? get activeSession => _activeSession;
  UserProfileResponseDto? get currentUser => _currentUser;
  bool get isAuthenticated => _activeSession != null && !_activeSession!.isExpired;

  void setEmail(String value) {
    _email = value;
    if (_errorMessage != null) {
      _errorMessage = null;
      notifyListeners();
    }
  }

  void setPassword(String value) {
    _password = value;
    if (_errorMessage != null) {
      _errorMessage = null;
      notifyListeners();
    }
  }

  void clearError() {
    if (_errorMessage != null) {
      _errorMessage = null;
      notifyListeners();
    }
  }

  Future<bool> signIn(AppLocalizations l10n) async {
    final validationError = _validator.validateSignIn(
      email: _email,
      password: _password,
      l10n: l10n,
    );
    if (validationError != null) {
      _errorMessage = validationError;
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final req = SignInRequestDto(email: _email, password: _password);
      final response = await _backendService.auth.signIn(req);
      _activeSession = response.session;
      _currentUser = response.profile;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = _mapBackendError(e, l10n);
      notifyListeners();
      return false;
    }
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String displayName,
    required AppLocalizations l10n,
  }) async {
    final validationError = _validator.validateSignUp(
      email: email,
      password: password,
      displayName: displayName,
      l10n: l10n,
    );
    if (validationError != null) {
      _errorMessage = validationError;
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final req = SignUpRequestDto(
        email: email,
        password: password,
        displayName: displayName,
      );
      final response = await _backendService.auth.signUp(req);
      _activeSession = response.session;
      _currentUser = response.profile;
      _email = email;
      _password = '';
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = _mapBackendError(e, l10n);
      notifyListeners();
      return false;
    }
  }

  Future<bool> register({
    required String displayName,
    required String email,
    required String password,
    required AppLocalizations l10n,
  }) async {
    return signUp(
      displayName: displayName,
      email: email,
      password: password,
      l10n: l10n,
    );
  }

  Future<void> signOut() async {
    if (_activeSession != null) {
      try {
        await _backendService.auth.signOut(_activeSession!.accessToken);
      } catch (_) {
        // Tolerant on sign-out network exceptions
      }
    }
    _activeSession = null;
    _currentUser = null;
    _password = '';
    _errorMessage = null;
    notifyListeners();
  }

  String _mapBackendError(Object error, AppLocalizations l10n) {
    if (error is AuthException) {
      switch (error.code) {
        case AuthException.invalidCredentials:
          return l10n.errors.invalidCredentials;
        case AuthException.emailAlreadyExists:
          return l10n.errors.emailAlreadyExists;
        case AuthException.userNotFound:
          return l10n.errors.invalidCredentials;
        case AuthException.invalidSession:
          return l10n.errors.invalidCredentials;
      }
    }
    final str = error.toString().toLowerCase();
    if (str.contains(AuthException.invalidCredentials)) {
      return l10n.errors.invalidCredentials;
    }
    if (str.contains(AuthException.emailAlreadyExists)) {
      return l10n.errors.emailAlreadyExists;
    }
    return l10n.errors.invalidCredentials;
  }
}
