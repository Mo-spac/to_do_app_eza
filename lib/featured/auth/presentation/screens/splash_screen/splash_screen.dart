import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app_ageeza/core/utils/app_assets.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';
import 'package:to_do_app_ageeza/core/utils/app_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.logo),
          SizedBox(
            height: 24,
          ),
          Text(
            AppStrings.appName,
            style: GoogleFonts.lato(
              color: AppColors.whiteColor,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    );
  }
}
