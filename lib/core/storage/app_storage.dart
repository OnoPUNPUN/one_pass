import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  AppStorage({
    required SharedPreferences preferences,
    required FlutterSecureStorage secureStorage,
  })  : _preferences = preferences,
        _secureStorage = secureStorage;

  final SharedPreferences _preferences;
  final FlutterSecureStorage _secureStorage;

  int? readInt(String key) => _preferences.getInt(key);

  Future<bool> writeInt(String key, int value) {
    return _preferences.setInt(key, value);
  }

  Future<void> writeSecure(String key, String value) {
    return _secureStorage.write(key: key, value: value);
  }

  Future<String?> readSecure(String key) {
    return _secureStorage.read(key: key);
  }
}
