import 'package:flutter/material.dart';
import '../../../services/user_local_storage_service.dart';
import '../../../core/service_locator.dart';

/// State management controller managing terminal settings and display mode.
/// Enforces Rule 10 of Agents.md: Holds state, not futures.
class SettingsController extends ChangeNotifier {
  final UserLocalStorageService _storage;

  bool _isDarkMode = true;
  bool _isNoiseEnabled = true;

  SettingsController({
    UserLocalStorageService? storage,
  }) : _storage = storage ?? serviceLocator<UserLocalStorageService>() {
    _loadPersistedPreferences();
  }

  bool get isDarkMode => _isDarkMode;
  bool get isNoiseEnabled => _isNoiseEnabled;

  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  Future<void> _loadPersistedPreferences() async {
    final dark = await _storage.getBool('pref_dark_mode');
    if (dark != null) _isDarkMode = dark;

    final noise = await _storage.getBool('pref_noise_enabled');
    if (noise != null) _isNoiseEnabled = noise;

    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    await _storage.setBool('pref_dark_mode', _isDarkMode);
  }

  Future<void> toggleNoise() async {
    _isNoiseEnabled = !_isNoiseEnabled;
    notifyListeners();
    await _storage.setBool('pref_noise_enabled', _isNoiseEnabled);
  }

  Future<void> setNoiseEnabled(bool value) async {
    if (_isNoiseEnabled == value) return;
    _isNoiseEnabled = value;
    notifyListeners();
    await _storage.setBool('pref_noise_enabled', _isNoiseEnabled);
  }
}
