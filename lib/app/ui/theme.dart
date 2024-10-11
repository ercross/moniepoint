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
  );
}
