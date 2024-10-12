import 'package:flutter/material.dart';

abstract class _LightThemeColor {
  static const Color primary = Color(0xFFFC9F12);
  static const Color secondary = Color(0xFFA5957E);
  static const Color backgroundLight = Color.fromARGB(255, 254, 254, 254);
  static const Color backgroundDeep = Color.fromARGB(255, 216, 164, 91);

  static const Color onBackgroundContainerLight = Color(0xFFFCF6F0);
  static const Color onBackgroundContainerDeep =
      Color.fromARGB(255, 251, 242, 222);
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
