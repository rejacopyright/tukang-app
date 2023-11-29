import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeConfig() {
  return ThemeData(
    fontFamily: GoogleFonts.outfit()
        .fontFamily, // comfortaa, outfit, poiretOne, catamaran, josefinSans, dosis
    useMaterial3: true,
    primaryColor: Colors.pink,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.pink,
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
        fontSize: 12,
        // fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        fontSize: 10,
      ),
    ),
  );
}
