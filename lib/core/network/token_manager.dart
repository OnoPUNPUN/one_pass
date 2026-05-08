import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  final FlutterSecureStorage _secureStorage;
  static const _accessTokenKey = 'ACCESS_TOKEN';
  static const _userIdKey = 'USER_ID';

  TokenManager(this._secureStorage);

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _accessTokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: _accessTokenKey);
  }

  Future<void> saveUserId(String userId) async {
    await _secureStorage.write(key: _userIdKey, value: userId);
  }

  Future<String?> getUserId() async {
    return await _secureStorage.read(key: _userIdKey);
  }

  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }
}
