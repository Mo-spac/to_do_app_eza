import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app_ageeza/app/app.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';
import 'package:to_do_app_ageeza/core/utils/app_strings.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 32.sp,
      ),
      bodyLarge: GoogleFonts.lato(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
      ),
      displayMedium: GoogleFonts.lato(
        color: AppColors.white,
        fontSize: 16.sp,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      hintStyle: GoogleFonts.lato(
        color: AppColors.white,
        fontSize: 16.sp,
      ),
      fillColor: AppColors.lightBlack,
      filled: true,
    ),
  );
}

ThemeData getAppDarkTheme() {
  return ThemeData(
    primaryColor: AppColors.red,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 32.sp,
      ),
      bodyLarge: GoogleFonts.lato(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
      ),
      displayMedium: GoogleFonts.lato(
        color: AppColors.white.withOpacity(0.44),
        fontSize: 16.sp,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}
