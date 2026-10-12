import 'package:flutter/material.dart';
import '../../../services/user_local_storage_service.dart';
import '../../../core/service_locator.dart';

/// State management controller managing terminal settings, CRT shaders, and display mode.
/// Enforces Rule 10 of Agents.md: Holds state, not futures.
class SettingsController extends ChangeNotifier {
  final UserLocalStorageService _storage;

  bool _isDarkMode = true;
  bool _isCrtEnabled = false;
  double _volume = 0.75;

  SettingsController({
    UserLocalStorageService? storage,
  }) : _storage = storage ?? serviceLocator<UserLocalStorageService>() {
    _loadPersistedPreferences();
  }

  bool get isDarkMode => _isDarkMode;
  bool get isCrtEnabled => _isCrtEnabled;
  double get volume => _volume;

  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  Future<void> _loadPersistedPreferences() async {
    final dark = await _storage.getBool('pref_dark_mode');
    if (dark != null) _isDarkMode = dark;

    final crt = await _storage.getBool('pref_crt_enabled');
    if (crt != null) _isCrtEnabled = crt;

    final vol = await _storage.getDouble('pref_volume');
    if (vol != null) _volume = vol;

    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    await _storage.setBool('pref_dark_mode', _isDarkMode);
  }

  Future<void> toggleCrt() async {
    _isCrtEnabled = !_isCrtEnabled;
    notifyListeners();
    await _storage.setBool('pref_crt_enabled', _isCrtEnabled);
  }

  Future<void> setVolume(double value) async {
    _volume = value.clamp(0.0, 1.0);
    notifyListeners();
    await _storage.setDouble('pref_volume', _volume);
  }
}
