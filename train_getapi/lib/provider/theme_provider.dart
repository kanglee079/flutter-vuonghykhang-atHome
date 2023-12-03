import 'package:flutter/material.dart';

import '../apps/share/share_pre.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode isChangeTheme = ThemeMode.light;
  bool switchTheme = false;

  void loadThemeFromPrefs() async {
    String? savedThemeMode = await SharePreCustom.getTheme();
    if (savedThemeMode != null) {
      switchTheme = savedThemeMode == 'dark';
      isChangeTheme = switchTheme ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }

  void changeTheme() async {
    switchTheme = !switchTheme;
    isChangeTheme = switchTheme ? ThemeMode.dark : ThemeMode.light;
    await SharePreCustom.saveTheme(switchTheme ? 'dark' : 'light');
    notifyListeners();
  }
}
