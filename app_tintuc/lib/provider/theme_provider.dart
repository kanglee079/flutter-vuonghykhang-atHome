import 'package:flutter/material.dart';

import '../apps/share/share_pre.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode isChangeTheme = ThemeMode.light;
  bool switchTheme = true;

  void loadThemeFromPrefs() async {
    String? savedThemeMode = await SharePreCustom.getTheme();
    if (savedThemeMode != null) {
      switchTheme = savedThemeMode == 'light';
      isChangeTheme = switchTheme ? ThemeMode.light : ThemeMode.dark;
      notifyListeners();
    }
  }

  void changeTheme() async {
    switchTheme = !switchTheme;
    isChangeTheme = switchTheme ? ThemeMode.light : ThemeMode.dark;
    await SharePreCustom.saveTheme(switchTheme ? 'light' : 'dark');
    notifyListeners();
  }
}
