import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app_ageeza/app/app.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';
import 'package:to_do_app_ageeza/core/utils/app_strings.dart';
import 'package:to_do_app_ageeza/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app_ageeza/featured/task/presentation/cubit/task_cubit/task_cubit.dart';
import 'package:to_do_app_ageeza/featured/task/presentation/cubit/task_cubit/task_state.dart';
import 'package:to_do_app_ageeza/featured/task/presentation/screens/add_task_screen/components/add_task_component.dart';

class AddTaskScreen extends StatelessWidget {
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.white,
            ),
          ),
          title: Text(
            AppStrings.addTask,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          centerTitle: false,
        ),
        body: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AddTaskComponent(
                        title: AppStrings.tilte,
                        controller: titleController,
                        hintText: AppStrings.tilteHint,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      AddTaskComponent(
                        title: AppStrings.note,
                        controller: noteController,
                        hintText: AppStrings.notehint,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      AddTaskComponent(
                        readOnly: true,
                        title: AppStrings.date,
                        hintText: DateFormat.yMd().format(
                            BlocProvider.of<TaskCubit>(context).currentDate),
                        suffixIcon: IconButton(
                            onPressed: () async {
                              BlocProvider.of<TaskCubit>(context)
                                  .getDate(context);
                            },
                            icon: Icon(
                              Icons.calendar_month_rounded,
                              color: AppColors.white,
                            )),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AddTaskComponent(
                              readOnly: true,
                              title: AppStrings.startTime,
                              hintText:
                                  BlocProvider.of<TaskCubit>(context).startTime,
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  BlocProvider.of<TaskCubit>(context)
                                      .getStartTime(context);
                                },
                                icon: Icon(
                                  Icons.timer_outlined,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 26.w,
                          ),
                          Expanded(
                            child: AddTaskComponent(
                              readOnly: true,
                              title: AppStrings.endTime,
                              hintText:
                                  BlocProvider.of<TaskCubit>(context).endTime,
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  BlocProvider.of<TaskCubit>(context)
                                      .getEndTime(context);
                                },
                                icon: Icon(
                                  Icons.timer_outlined,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Column(
                        children: [
                          Text(AppStrings.color,
                              style: Theme.of(context).textTheme.displayMedium),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            height: 48.h,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 8.w,
                                    ),
                                itemBuilder: (context, index) {
                                  ///////////////

                                  return GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<TaskCubit>(context)
                                          .changeCheckMarkColor(index);
                                    },
                                    child: CircleAvatar(
                                        backgroundColor:
                                            BlocProvider.of<TaskCubit>(context)
                                                .getColors(index),
                                        child: index ==
                                                BlocProvider.of<TaskCubit>(
                                                        context)
                                                    .currentIndex
                                            ? Icon(Icons.check)
                                            : null),
                                  );
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      SizedBox(
                        height: 48.h,
                        width: double.infinity.w,
                        child: CustomElevatedButton(
                          onPressed: () {},
                          text: AppStrings.addTask,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
