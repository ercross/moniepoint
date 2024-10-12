import 'package:flutter/material.dart';

abstract class _LightThemeColor {
  static const Color primary = Color(0xFFFC9F12);
  static const Color secondary = Color(0xFFA5957E);
  static const Color backgroundLight = Color(0xFFF9F8F9);
  static const Color backgroundDeep = Color.fromARGB(255, 233, 173, 90);
  static const Color onBackgroundContainerLight =
      Color(0xFFFEFFFE);
  static const Color onBackgroundContainerDeep =
      Color.fromARGB(255, 252, 242, 218);
}

abstract class AppTheme {
  static const String _font = "Ubuntu";

  static ThemeData lightMode = ThemeData(
    fontFamily: _font,
    colorScheme: const ColorScheme.light(
      primary: _LightThemeColor.primary,
      secondary: _LightThemeColor.secondary,
      tertiary: Colors.black,
      onPrimary: Colors.white,
      surfaceBright: _LightThemeColor.backgroundLight,
      surfaceDim: _LightThemeColor.backgroundDeep,
      surfaceContainerLow: _LightThemeColor.onBackgroundContainerLight,
      surfaceContainerHigh: _LightThemeColor.onBackgroundContainerDeep,
      onSurface: _LightThemeColor.secondary,
      brightness: Brightness.light,
    ),
  );
}
