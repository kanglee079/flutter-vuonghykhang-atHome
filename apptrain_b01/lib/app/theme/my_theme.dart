import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(color: Colors.black, fontSize: 50),
          bodyMedium: const TextStyle(color: Colors.amber, fontSize: 50),
          displayLarge: const TextStyle(color: Colors.indigo),
        ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    textTheme: ThemeData.dark().textTheme.copyWith(
          bodyLarge: const TextStyle(color: Colors.red),
          bodyMedium: const TextStyle(color: Colors.blue, fontSize: 50),
          displayLarge: const TextStyle(color: Colors.green),
        ),
  );
}
