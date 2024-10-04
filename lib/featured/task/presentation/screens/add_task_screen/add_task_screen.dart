import 'package:flutter/material.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';
import 'package:to_do_app_ageeza/core/utils/app_strings.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.note,
                  style: Theme.of(context).textTheme.displayMedium),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: AppStrings.tilteHint,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(AppStrings.tilte,
                  style: Theme.of(context).textTheme.displayMedium),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: noteController,
                decoration: InputDecoration(
                  hintText: AppStrings.notehint,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
