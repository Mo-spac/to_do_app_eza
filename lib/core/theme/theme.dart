import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      bodyLarge: GoogleFonts.lato(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      displayMedium: GoogleFonts.lato(
        color: AppColors.whiteColor.withOpacity(0.44),
        fontSize: 16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}

ThemeData getAppDarkTheme() {
  return ThemeData(
    primaryColor: AppColors.redColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      bodyLarge: GoogleFonts.lato(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      displayMedium: GoogleFonts.lato(
        color: AppColors.whiteColor.withOpacity(0.44),
        fontSize: 16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.redColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}
