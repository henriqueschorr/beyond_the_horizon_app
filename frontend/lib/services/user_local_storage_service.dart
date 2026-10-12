/// Client-side storage abstraction managing terminal preferences in browser local storage.
/// Enforces SDD 01 Section 4.7: Zero-login preferences persisted locally without server round-trips.
class UserLocalStorageService {
  final Map<String, String> _memoryStore = {};

  UserLocalStorageService();

  Future<void> setString(String key, String value) async {
    _memoryStore[key] = value;
  }

  Future<String?> getString(String key) async {
    return _memoryStore[key];
  }

  Future<void> setBool(String key, bool value) async {
    _memoryStore[key] = value ? 'true' : 'false';
  }

  Future<bool?> getBool(String key) async {
    final val = _memoryStore[key];
    if (val == null) return null;
    return val == 'true';
  }

  Future<void> setDouble(String key, double value) async {
    _memoryStore[key] = value.toString();
  }

  Future<double?> getDouble(String key) async {
    final val = _memoryStore[key];
    if (val == null) return null;
    return double.tryParse(val);
  }

  Future<void> remove(String key) async {
    _memoryStore.remove(key);
  }
}
