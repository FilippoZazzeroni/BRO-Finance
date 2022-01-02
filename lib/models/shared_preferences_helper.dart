

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  //MARK: methods

  static Future setValue(String key, Object value) async {
    final prefInstance = await SharedPreferences.getInstance();

    if (value is bool) {
      prefInstance.setBool(key, value);
    } else if (value is String) {
      prefInstance.setString(key, value);
    } else if (value is double) {
      prefInstance.setDouble(key, value);
    }
  }

  static Future<Object?> getValue(String key) async {
    final prefInstance = await SharedPreferences.getInstance();
    return prefInstance.get(key);
  }
}