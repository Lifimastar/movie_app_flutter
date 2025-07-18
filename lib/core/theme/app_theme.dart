import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF00BFA6);
  static const Color darkBackgroundColor = Color(0xFF121212);
  static const Color cardColor = Color(0xFF1E1E1E);

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkBackgroundColor,

    appBarTheme: const AppBarTheme(
      color: darkBackgroundColor,
      elevation: 0,
      centerTitle: true,
    ),

    cardTheme: const CardThemeData(color: cardColor, elevation: 2),

    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.dark().textTheme,
    ).apply(bodyColor: Colors.white, displayColor: Colors.white),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
  );
}
