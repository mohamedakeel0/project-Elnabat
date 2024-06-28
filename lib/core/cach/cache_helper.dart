import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheStorage {
  static late final SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void write({required String key, required dynamic value}) {
    if (value is String) {
      _sharedPreferences.setString(key, value);
    } else if (value is int) {
      _sharedPreferences.setInt(key, value);
    } else if (value is double) {
      _sharedPreferences.setDouble(key, value);
    } else if (value is bool) {
      _sharedPreferences.setBool(key, value);
    } else if (value is List<String>) {
      _sharedPreferences.setStringList(key, value);
    } else {
      print("object");
    }
  }

  static dynamic read({required String key}) {
    return _sharedPreferences.get(key);
  }
}

class SecureStorage {
  SecureStorage._();

  static const _storage = FlutterSecureStorage();

  static Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  static Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
