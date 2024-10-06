// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'task_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';
import 'package:to_do_app_ageeza/featured/task/presentation/cubit/task_cubit/task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  DateTime currentDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a').format(
    DateTime.now().add(
      Duration(minutes: 45),
    ),
  );
  int currentIndex = 0;

  getDate(context) async {
    emit(TaskDateLoadingState());
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2027),
      // initialDatePickerMode: DatePickerMode.day,
      // initialEntryMode: DatePickerEntryMode.inputOnly,
    );

    if (pickedDate != null) {
      currentDate = pickedDate;
      emit(TaskDateCateSuccessState());
    } else {
      print('pickedDate == null');
      emit(TaskDateFailureState());
    }
  }

  getStartTime(context) async {
    emit(TaskStartTimeLoadingState());
    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedStartTime != null) {
      startTime = pickedStartTime.format(context);
      emit(TaskStartTimeSuccessState());
    } else {
      print('Start Time == null');
      emit(TaskStartTimFailureState());
    }
  }

  getEndTime(context) async {
    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedStartTime != null) {
      endTime = pickedStartTime.format(context);
    } else {
      print('End Time == null');
    }
  }

  Color getColors(index) {
    switch (index) {
      case 0:
        return AppColors.red;
      case 1:
        return AppColors.green;
      case 2:
        return AppColors.blueGrey;
      case 3:
        return AppColors.blue;
      case 4:
        return AppColors.orange;
      case 5:
        return AppColors.purple;

      default:
        return AppColors.grey;
    }
  }

  void changeCheckMarkColor(index) {
    currentIndex = index;
    emit(ChangeCheckMarkColorState());
  }
}
