import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app_ageeza/core/database/cache_helper.dart';
import 'package:to_do_app_ageeza/core/service_locator/service_locator.dart';
import 'package:to_do_app_ageeza/core/utils/app_assets.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';
import 'package:to_do_app_ageeza/core/utils/app_strings.dart';
import 'package:to_do_app_ageeza/featured/auth/presentation/screens/on_boarding_screens/on_boarding_screens.dart';
import 'package:to_do_app_ageeza/featured/task/presentation/screens/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void naviate() {
    bool isVisited =
        sL<CacheHelper>().getData(key: AppStrings.onBoardingKey) ?? false;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                isVisited ? const HomeScreen() : OnBoardingScreens(),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    naviate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.backgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.logo),
          const SizedBox(
            height: 24,
          ),
          Text(AppStrings.appName,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 40,
                  )),
        ],
      )),
    );
  }
}
