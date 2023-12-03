import 'package:flutter/material.dart';

import '../config/const.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      color: dLightMainColor,
    ),
    cardColor: dLightMainColor,
    indicatorColor: const Color(0xffC8EDD9),
    highlightColor: const Color(0xFFc29c1d),
    canvasColor: Colors.white,
    dividerColor: const Color(0xFFEDEDED),
    hintColor: const Color(0xffC4C4C4),
    primaryColor: Colors.black,
    focusColor: const Color(0xffFFEECC),
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          bodySmall: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          displayLarge: const TextStyle(
            color: Color(0xFF7D8FAB),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          displayMedium: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
          displaySmall: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          labelLarge: const TextStyle(
            color: dLightMainColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
          labelMedium: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
          labelSmall: const TextStyle(
            color: dLightMainColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
          titleSmall: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: const TextStyle(
            color: Color(0xFFc29c1d),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          headlineMedium: const TextStyle(
            color: dLightMainColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          headlineSmall: const TextStyle(
            fontSize: 16,
            color: Color(0xffbfc9da),
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.lineThrough,
          ),
          headlineLarge: const TextStyle(
            color: Color(0xff28b0ce),
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      color: dDarkMainColor,
    ),
    cardColor: dDarkMainColor,
    indicatorColor: const Color(0xff371226),
    highlightColor: const Color(0xFF3d63e2),
    canvasColor: const Color(0xFF282828),
    dividerColor: const Color(0xFF121212),
    hintColor: const Color(0xff3B3B3B),
    primaryColor: Colors.white,
    textTheme: ThemeData.dark().textTheme.copyWith(
          bodyLarge: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          bodySmall: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          displayLarge: const TextStyle(
            color: Color(0xFF7D8FAB),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          displayMedium: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
          displaySmall: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          labelLarge: const TextStyle(
            color: dDarkMainColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
          labelMedium: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
          labelSmall: const TextStyle(
            color: dDarkMainColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
          titleSmall: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: const TextStyle(
              color: Color(0xFF3d63e2),
              fontSize: 16,
              fontWeight: FontWeight.w500),
          headlineMedium: const TextStyle(
            color: dDarkMainColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          headlineSmall: const TextStyle(
            fontSize: 16,
            color: Color(0xffbfc9da),
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.lineThrough,
          ),
          headlineLarge: const TextStyle(
            color: Color(0xffD74F31),
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
  );
}
