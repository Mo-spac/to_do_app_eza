import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';
import 'package:to_do_app_ageeza/core/utils/app_strings.dart';
import 'package:to_do_app_ageeza/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app_ageeza/featured/task/presentation/screens/add_task_screen/components/add_task_component.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  DateTime currentDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a').format(
    DateTime.now().add(
      Duration(minutes: 45),
    ),
  );
  int currentIndex = 0;

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddTaskComponent(
                    title: AppStrings.tilte,
                    controller: titleController,
                    hintText: AppStrings.tilteHint,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  AddTaskComponent(
                    title: AppStrings.note,
                    controller: noteController,
                    hintText: AppStrings.notehint,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  AddTaskComponent(
                    readOnly: true,
                    title: AppStrings.date,
                    hintText: DateFormat.yMd().format(currentDate),
                    suffixIcon: IconButton(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2027),
                            // initialDatePickerMode: DatePickerMode.day,
                            // initialEntryMode: DatePickerEntryMode.inputOnly,
                          );

                          if (pickedDate != null) {
                            setState(() {
                              currentDate = pickedDate;
                            });
                          } else {
                            print('pickedDate == null');
                          }
                        },
                        icon: Icon(
                          Icons.calendar_month_rounded,
                          color: AppColors.white,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AddTaskComponent(
                          readOnly: true,
                          title: AppStrings.startTime,
                          hintText: startTime,
                          suffixIcon: IconButton(
                            onPressed: () async {
                              TimeOfDay? pickedStartTime = await showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(DateTime.now()),
                              );

                              if (pickedStartTime != null) {
                                setState(() {
                                  startTime = pickedStartTime.format(context);
                                });
                              } else {
                                print('Start Time == null');
                              }
                            },
                            icon: Icon(
                              Icons.timer_outlined,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 26,
                      ),
                      Expanded(
                        child: AddTaskComponent(
                          readOnly: true,
                          title: AppStrings.endTime,
                          hintText: endTime,
                          suffixIcon: IconButton(
                            onPressed: () async {
                              TimeOfDay? pickedStartTime = await showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(DateTime.now()),
                              );

                              if (pickedStartTime != null) {
                                setState(() {
                                  endTime = pickedStartTime.format(context);
                                });
                              } else {
                                print('End Time == null');
                              }
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
                    height: 24,
                  ),
                  Column(
                    children: [
                      Text(AppStrings.color,
                          style: Theme.of(context).textTheme.displayMedium),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 48,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 8,
                                ),
                            itemBuilder: (context, index) {
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

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                                child: CircleAvatar(
                                    backgroundColor: getColors(index),
                                    child: index == currentIndex
                                        ? Icon(Icons.check)
                                        : null),
                              );
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onPressed: () {},
                      text: AppStrings.addTask,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
