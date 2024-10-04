import 'package:flutter/material.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';
import 'package:to_do_app_ageeza/core/utils/app_strings.dart';
import 'package:to_do_app_ageeza/core/widgets/custom_elevated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(padding: const EdgeInsets.all(24.0), child: Text("data")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(24),
                  height: 240,
                  decoration: BoxDecoration(
                    color: AppColors.deepGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          backgroundColor: AppColors.red,
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
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
