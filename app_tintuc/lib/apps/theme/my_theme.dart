import 'package:flutter/material.dart';

import '../config/const.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: TextStyle(color: Colors.grey[800]),
          bodyMedium: styleTitleItemLight,
          bodySmall: styleTextItemLight,
        ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.grey[850],
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: ThemeData.dark().textTheme.copyWith(
          bodyLarge: TextStyle(color: Colors.grey[300]),
          bodyMedium: styleTitleItemDark,
          bodySmall: styleTextItemDark,
        ),
    colorScheme: ColorScheme.dark(
        primary: Colors.grey[850] ?? Colors.grey,
        onPrimary: Colors.green[300] ?? Colors.green,
        secondary: Colors.blueGrey[700] ?? Colors.blueGrey,
        onSecondary: Colors.grey[300] ?? Colors.grey),
  );
}
