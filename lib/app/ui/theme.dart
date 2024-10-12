import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTheme {
  static const String _font = "TTFors";

  static ThemeData lightMode = ThemeData(
      fontFamily: _font,
      colorScheme: const ColorScheme.light(
        primary: AppColor.primary,
        brightness: Brightness.light,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontFamily: _font,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColor.textGold,
        ),
        headlineSmall: TextStyle(
          fontFamily: _font,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        bodySmall: TextStyle(
          fontFamily: _font,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColor.textGold,
        ),
        bodyMedium: TextStyle(
          fontFamily: _font,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColor.textGold,
        ),
      ));
}
