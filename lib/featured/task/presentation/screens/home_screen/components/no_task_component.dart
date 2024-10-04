import 'package:flutter/material.dart';
import 'package:to_do_app_ageeza/core/utils/app_assets.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';
import 'package:to_do_app_ageeza/core/utils/app_strings.dart';

class NoTaskComponent extends StatelessWidget {
  const NoTaskComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.noTasks),
        Text(
          AppStrings.noTaskTitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(AppStrings.noTaskSubTitle,
            style: Theme.of(context).textTheme.displayMedium),
      ],
    );
  }
}
