import 'package:flutter/material.dart';
import 'package:flutter_sway_app/core/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData appTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme(),
      floatingActionButtonTheme: floatingActionButtonTheme(),
      textTheme: GoogleFonts.latoTextTheme(),
    );
  }

  // AppBar Theme
  static AppBarTheme appBarTheme() {
    return AppBarTheme(
      backgroundColor: AppColors.backgroundColor.withOpacity(0.8),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.lato(
        color: AppColors.primaryTextColor,
        fontSize: 26,
      ),
    );
  }

  // FloatingActionButton Theme
  static FloatingActionButtonThemeData floatingActionButtonTheme() {
    return const FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondaryButtonColor,
    );
  }
}
