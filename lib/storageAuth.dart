import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  // Create a single instance of FlutterSecureStorage
  static const _storage = FlutterSecureStorage();

  // Key used to store the token
  static const _tokenKey = 'auth_token';

  /// Save token securely
  static Future<void> addToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  /// Get stored token (returns null if not found)
  static Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  /// Delete stored token
  static Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  /// Check if a token exists
  static Future<bool> hasToken() async {
    final token = await _storage.read(key: _tokenKey);
    return token != null && token.isNotEmpty;
  }

  /// Optional: Clear all keys (if needed)
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}