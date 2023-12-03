import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharePreCustom {
  static saveData(List data, {key = 'listCategory'}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(data));
  }

  static getData({key = 'listCategory'}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString(key) ?? '[]';
    List<int> listCategory = List<int>.from(jsonDecode(data));
    return listCategory;
  }

  static saveTheme(String theme, {key = 'appTheme'}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, theme);
  }

  static Future<String?> getTheme({key = 'appTheme'}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
