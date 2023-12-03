import 'package:shared_preferences/shared_preferences.dart';

class SharePreCustom {
  static saveTheme(String theme, {key = 'appTheme'}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, theme);
  }

  static Future<String?> getTheme({key = 'appTheme'}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
