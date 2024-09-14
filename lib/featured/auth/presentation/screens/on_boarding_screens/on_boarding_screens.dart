import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app_ageeza/core/utils/app_assets.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';
import 'package:to_do_app_ageeza/core/utils/app_strings.dart';
import 'package:to_do_app_ageeza/featured/auth/data/models/onboarding_model.dart';
import 'package:to_do_app_ageeza/featured/task/presentation/screens/home_screen.dart';

class OnBoardingScreens extends StatelessWidget {
  OnBoardingScreens({super.key});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: PageView.builder(
              controller: pageController,
              itemCount: OnBoardingModel.onBoardingScreens.length,
              itemBuilder: (contex, index) {
                return Column(
                  children: [
                    // skip text
                    index == OnBoardingModel.onBoardingScreens.length - 1
                        ? SizedBox()
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                pageController.jumpToPage(
                                    OnBoardingModel.onBoardingScreens.length -
                                        1);
                              },
                              child: Text(
                                AppStrings.skipName,
                                style: GoogleFonts.lato(
                                  color: AppColors.whiteColor.withOpacity(0.44),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),

                    // SizedBox(
                    //   height: 16,
                    // ),
                    // image
                    Image.asset(
                      OnBoardingModel.onBoardingScreens[index].imagePath,
                      height: 290,
                    ),
                    // SizedBox(
                    //   height: 16,
                    // ),
                    // dots
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: AppColors.primaryColor,
                        // dotColor: AppColors.redColor,
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 8,
                      ),
                    ),

                    SizedBox(
                      height: 52,
                    ),
                    //title
                    Text(
                      OnBoardingModel.onBoardingScreens[index].title,
                      style: GoogleFonts.lato(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    // SizedBox(
                    //   height: 42,
                    // ),
                    // // sunTitle
                    Text(
                      OnBoardingModel.onBoardingScreens[index].subTitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: AppColors.whiteColor.withOpacity(0.87),
                        fontSize: 16,
                      ),
                    ),
                    // SizedBox(
                    //   height: 100,
                    // ),
                    // buttons
                    Row(
                      children: [
                        // back button
                        index == 0
                            ? SizedBox()
                            : TextButton(
                                onPressed: () {
                                  pageController.previousPage(
                                      duration: Duration(milliseconds: 1000),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                },
                                child: Text(
                                  AppStrings.backName,
                                  style: GoogleFonts.lato(
                                    color:
                                        AppColors.whiteColor.withOpacity(0.44),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                        Spacer(),

                        // next button
                        index == OnBoardingModel.onBoardingScreens.length - 1
                            ? ElevatedButton(
                                onPressed: () {
                                  // Navigat to Home
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => HomeScreen(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  AppStrings.getStartedName,
                                  style: GoogleFonts.lato(
                                    color: AppColors.whiteColor,
                                    // fontSize: 16,
                                  ),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  pageController.nextPage(
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                  );
                                  // Navigat to Home
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  AppStrings.nextName,
                                  style: GoogleFonts.lato(
                                    color: AppColors.whiteColor,
                                    // fontSize: 16,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
