import 'package:flutter/material.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';
import 'package:to_do_app_ageeza/core/utils/app_strings.dart';

class TaskComponent extends StatelessWidget {
  const TaskComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(8),
      height: 135,
      decoration: BoxDecoration(
        color: AppColors.redColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Task 1', style: Theme.of(context).textTheme.displayLarge),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.timer,
                    color: AppColors.whiteColor,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '09:33 PM - 09:48 PM',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColors.whiteColor,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text('Learn Dart',
                  style: Theme.of(context).textTheme.displayLarge),
            ],
          ),
          Row(
            children: [
              Container(
                height: 80,
                width: 1,
                color: AppColors.whiteColor,
              ),
              SizedBox(
                width: 8,
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  AppStrings.toDo,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
