import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeConfig() {
  return ThemeData(
    fontFamily: GoogleFonts.openSans().fontFamily,
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
      ),
      displaySmall: TextStyle(
        fontSize: 10,
      ),
    ),
  );
}
