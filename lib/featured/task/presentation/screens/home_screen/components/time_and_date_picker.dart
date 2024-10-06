import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';
import 'package:to_do_app_ageeza/core/utils/app_strings.dart';

class TimeAndDatePicker extends StatelessWidget {
  const TimeAndDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        DateFormat.yMMMMd().format(DateTime.now()),
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      SizedBox(
        height: 12.h,
      ),
      Text(
        AppStrings.today,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
            ),
      ),
      SizedBox(
        height: 12.h,
      ),
      DatePicker(
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        selectionColor: AppColors.primary,
        selectedTextColor: AppColors.white,
        dateTextStyle: Theme.of(context).textTheme.displayMedium!,
        monthTextStyle: Theme.of(context).textTheme.displayMedium!,
        dayTextStyle: Theme.of(context).textTheme.displayMedium!,
        onDateChange: (date) {
          // New date selected
          //   setState(() {
          //     _selectedValue = date;
          //   });
        },
      )
    ]);
  }
}
