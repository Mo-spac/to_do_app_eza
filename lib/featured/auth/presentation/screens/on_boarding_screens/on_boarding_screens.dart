import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app_ageeza/core/commons/common.dart';
import 'package:to_do_app_ageeza/core/database/cache_helper.dart';
import 'package:to_do_app_ageeza/core/service_locator/service_locator.dart';
import 'package:to_do_app_ageeza/core/utils/app_assets.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';
import 'package:to_do_app_ageeza/core/utils/app_strings.dart';
import 'package:to_do_app_ageeza/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app_ageeza/core/widgets/custom_text_button.dart';
import 'package:to_do_app_ageeza/featured/auth/data/models/onboarding_model.dart';
import 'package:to_do_app_ageeza/featured/task/presentation/screens/home_screen/home_screen.dart';

class OnBoardingScreens extends StatelessWidget {
  OnBoardingScreens({super.key});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.backgroundColor,
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
                        ? const SizedBox()
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: CustomTextButton(
                              onPressed: () {
                                pageController.jumpToPage(
                                    OnBoardingModel.onBoardingScreens.length -
                                        1);
                              },
                              text: AppStrings.skipName,
                            ),
                            // TextButton(
                            //   onPressed: () {
                            //     pageController.jumpToPage(
                            //         OnBoardingModel.onBoardingScreens.length -
                            //             1);
                            //   },
                            //   child: Text(AppStrings.skipName,
                            //       style: Theme.of(context)
                            //           .textTheme
                            //           .displayMedium!
                            //           .copyWith(
                            //             fontSize: 16,
                            //           )),
                            // ),
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
                      count: OnBoardingModel.onBoardingScreens.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Theme.of(context).primaryColor,
                        // dotColor: AppColors.redColor,
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 8,
                      ),
                    ),

                    const SizedBox(
                      height: 52,
                    ),
                    //title
                    Text(
                      OnBoardingModel.onBoardingScreens[index].title,
                      style: GoogleFonts.lato(
                        color: AppColors.white,
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
                        color: AppColors.white.withOpacity(0.87),
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
                            ? const SizedBox()
                            : CustomTextButton(
                                onPressed: () {
                                  pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                },
                                text: AppStrings.backName,
                              ),
                        // TextButton(
                        //     onPressed: () {
                        //       pageController.previousPage(
                        //           duration:
                        //               const Duration(milliseconds: 1000),
                        //           curve: Curves.fastLinearToSlowEaseIn);
                        //     },
                        //     child: Text(
                        //       AppStrings.backName,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .displayMedium!
                        //           .copyWith(
                        //             color: Colors.white,
                        //           ),
                        //     ),
                        //   )

                        const Spacer(),

                        // next button
                        index == OnBoardingModel.onBoardingScreens.length - 1
                            ? CustomElevatedButton(
                                onPressed: () async {
                                  await sL<CacheHelper>()
                                      .saveData(
                                          key: AppStrings.onBoardingKey,
                                          value: true)
                                      .then((value) {
                                    print('Boarding is visited');
                                    navigate(
                                        context: context,
                                        screen: const HomeScreen());
                                    // Navigator.pushReplacement(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (_) => const HomeScreen(),
                                    //   ),
                                    // );
                                  }).catchError((e) {
                                    print(e.toString());
                                  });
                                },
                                text: AppStrings.getStartedName,
                              )
                            // ElevatedButton(
                            //     onPressed: () async {
                            //       await sL<CacheHelper>()
                            //           .saveData(
                            //               key: AppStrings.onBoardingKey,
                            //               value: true)
                            //           .then((value) {
                            //         print('Boarding is visited');
                            //         Navigator.pushReplacement(
                            //           context,
                            //           MaterialPageRoute(
                            //             builder: (_) => const HomeScreen(),
                            //           ),
                            //         );
                            //       }).catchError((e) {
                            //         print(e.toString());
                            //       });
                            //     },
                            //     style:
                            //         Theme.of(context).elevatedButtonTheme.style,
                            //     child: Text(
                            //       AppStrings.getStartedName,
                            //       style: Theme.of(context)
                            //           .textTheme
                            //           .displayMedium!
                            //           .copyWith(
                            //             color: Colors.white,
                            //           ),
                            //     ),
                            //   )
                            : CustomElevatedButton(
                                onPressed: () {
                                  pageController.nextPage(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                  );
                                },
                                text: AppStrings.nextName,
                              )
                        // ElevatedButton(
                        //     onPressed: () {
                        //       pageController.nextPage(
                        //         duration:
                        //             const Duration(milliseconds: 1000),
                        //         curve: Curves.fastLinearToSlowEaseIn,
                        //       );
                        //       // Navigat to Home
                        //     },
                        //     style:
                        //         Theme.of(context).elevatedButtonTheme.style,
                        //     child: Text(
                        //       AppStrings.nextName,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .displayMedium!
                        //           .copyWith(
                        //             color: Colors.white,
                        //           ),
                        //     ),
                        //   ),
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
