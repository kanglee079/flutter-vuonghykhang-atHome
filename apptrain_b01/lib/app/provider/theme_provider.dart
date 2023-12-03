import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode isChangeTheme = ThemeMode.light;
  bool switchchange = true;

  void changeTheme() {
    switchchange = !switchchange;
    isChangeTheme = switchchange ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
