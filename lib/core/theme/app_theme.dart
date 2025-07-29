import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // estandar
  static const Color primaryColor = Color(0xFF00BFA6);
  static const Color darkBackgroundColor = Color(0xFF121212);
  static const Color cardColor = Color(0xFF1E1E1E);
  // login
  static const Color loginBackgroundColor = Color(0xFF221112);
  static const Color inputBackgroundColor = Color(0xFF472426);
  static const Color placeholderColor = Color(0xFFC89295);
  static const Color primaryButtonColor = Color(0xFFE92932);
  // registro
  static const Color signUpBackgroundColor = Color(0xFF1F1415);
  static const Color signUpInputColor = Color(0xFF412A2B);
  static const Color signUpPlaceholderColor = Color(0xFFBF9C9E);
  static const Color signUpButtonColor = Color(0xFFE8B4B7);
  static const Color signUpButtonTextColor = Color(0xFF1F1415);

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
