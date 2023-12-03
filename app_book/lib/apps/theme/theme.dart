import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      color: Color(0xFFB6C7D1),
    ),
    primaryColor: const Color(0xFF7986CB),
    cardColor: const Color(0xFFFF9900),
    dividerColor: const Color(0xFF9E9E9E),
    hintColor: const Color(0xFFD9D9D9),
    focusColor: const Color(0xFFB2DFDB),
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(
            color: Color(0xFF212121),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: const TextStyle(
            color: Color(0xFF212121),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: const TextStyle(
            color: Color(0xFF212121),
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          titleSmall: const TextStyle(
            color: Color(0xFF212121),
            fontSize: 14,
          ),
          titleMedium: const TextStyle(
            color: Color(0xFF212121),
            fontSize: 16,
          ),
          titleLarge: const TextStyle(
            color: Color(0xFF212121),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      color: Color(0xFF263238),
    ),
    primaryColor: const Color(0xFF546E7A),
    cardColor: const Color(0xFF6699FF),
    dividerColor: const Color(0xFFBDBDBD),
    hintColor: const Color(0xFFEEEEEE),
    focusColor: const Color(0xFF80CBC4),
    textTheme: ThemeData.dark().textTheme.copyWith(
          bodyLarge: const TextStyle(
            color: Color(0xFFE0E0E0),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: const TextStyle(
            color: Color(0xFFE0E0E0),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: const TextStyle(
            color: Color(0xFFE0E0E0),
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          titleMedium: const TextStyle(
            color: Color(0xFFB0BEC5),
            fontSize: 14,
          ),
          titleLarge: const TextStyle(
            color: Color(0xFFCFD8DC),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
  );
}
