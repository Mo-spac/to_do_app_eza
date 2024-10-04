import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app_ageeza/core/commons/common.dart';
import 'package:to_do_app_ageeza/core/utils/app_assets.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';
import 'package:to_do_app_ageeza/core/utils/app_strings.dart';
import 'package:to_do_app_ageeza/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app_ageeza/core/widgets/custom_text_button.dart';
import 'package:to_do_app_ageeza/featured/task/presentation/screens/home_screen/components/no_task_component.dart';
import 'package:to_do_app_ageeza/featured/task/presentation/screens/home_screen/components/task_component.dart';
import 'package:to_do_app_ageeza/featured/task/presentation/screens/home_screen/components/time_and_date_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TimeAndDatePicker(),
                  SizedBox(
                    height: 50,
                  ),
                  // no tasks
                  // NoTaskComponent(),
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.all(24),
                              height: 240,
                              decoration: BoxDecoration(
                                color: AppColors.deepGreyColor,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 48,
                                    width: double.infinity,
                                    child: CustomElevatedButton(
                                      onPressed: () {},
                                      text: AppStrings.taskCompleted,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 48,
                                    width: double.infinity,
                                    child: CustomElevatedButton(
                                      backgroundColor: AppColors.redColor,
                                      onPressed: () {},
                                      text: AppStrings.deleteTask,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 48,
                                    width: double.infinity,
                                    child: CustomElevatedButton(
                                      onPressed: () {},
                                      text: AppStrings.cancel,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: TaskComponent()),
                  // TaskComponent(),
                  // TaskComponent(),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // navigate(context: context, screen: screen)
          },
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            Icons.add,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
