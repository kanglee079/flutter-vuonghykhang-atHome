import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode isChangeTheme = ThemeMode.light;
  bool switchTheme = true;

  void changeTheme() {
    switchTheme = !switchTheme;
    isChangeTheme = switchTheme ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
