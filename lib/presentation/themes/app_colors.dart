import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color PRIMARY = Colors.black;
  static const Color GREY = Colors.grey;
  static const Color WHITE = Colors.white;

  static const MaterialColor PRIMARY_SWATCH = const MaterialColor(
    0xFF000000,
    const <int, Color>{
      50: const Color(0xFFF3F3F3),
      100: const Color(0xFFE6E6E6),
      200: const Color(0xFFC0C0C0),
      300: const Color(0xFF979797),
      400: const Color(0xFF4D4D4D),
      500: const Color(0xFF000000),
      600: const Color(0xFF000000),
      700: const Color(0xFF000000),
      800: const Color(0xFF000000),
      900: const Color(0xFF000000),
    },
  );
}
