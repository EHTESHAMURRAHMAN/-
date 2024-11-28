import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferences? _prefs;

  /// Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save data to SharedPreferences
  static Future<void> save(String key, dynamic value) async {
    if (value is String) {
      await _prefs?.setString(key, value);
    } else if (value is int) {
      await _prefs?.setInt(key, value);
    } else if (value is bool) {
      await _prefs?.setBool(key, value);
    } else if (value is double) {
      await _prefs?.setDouble(key, value);
    } else if (value is List<String>) {
      await _prefs?.setStringList(key, value);
    } else {
      await _prefs?.setString(key, jsonEncode(value));
    }
  }

  /// Retrieve data from SharedPreferences
  static dynamic get(String key) {
    final value = _prefs?.get(key);
    if (value is String && _isJson(value)) {
      return jsonDecode(value);
    }
    return value;
  }

  /// Remove data from SharedPreferences
  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  /// Clear all data from SharedPreferences
  static Future<void> clear() async {
    await _prefs?.clear();
  }

  /// Check if value is JSON
  static bool _isJson(String str) {
    try {
      jsonDecode(str);
      return true;
    } catch (e) {
      return false;
    }
  }
}
