import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeConfig() {
  return ThemeData(
    fontFamily: GoogleFonts.comfortaa()
        .fontFamily, // comfortaa, outfit, poiretOne, catamaran, josefinSans, dosis
    useMaterial3: true,
    primaryColor: const Color(0xffff5000),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xffff5000),
      // brightness: Brightness.dark,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      // ···
      titleLarge: TextStyle(
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        // fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        fontSize: 10,
      ),
    ),
  );
}
