import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';
import 'package:to_do_app_ageeza/core/utils/app_strings.dart';
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
                controller: noteController,
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
                      setState(() {});
                      currentDate = pickedDate!;
                    },
                    icon: Icon(
                      Icons.calendar_month_rounded,
                      color: AppColors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
