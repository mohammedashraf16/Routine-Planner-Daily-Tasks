import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/core/functions/firebase_functions.dart';
import 'package:todo_app/features/home/domain/model/tasks_model.dart';
class CustomElevatedButtonAddTask extends StatelessWidget {
  const CustomElevatedButtonAddTask({super.key, required this.titleController, required this.descriptionController,required this.formKey, required this.selectedDate});
  final formKey;
 final TextEditingController titleController;
 final TextEditingController descriptionController;
 final DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
          WidgetStatePropertyAll(AppColors.primaryColor)),
      onPressed: () {
        addNewTask(context);
      },
      child: Text(
        AppLocalizations.of(context)!.add_task,
        style: Theme
            .of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
  void addNewTask(BuildContext context) {
    if (formKey.currentState?.validate() == true) {
      TaskModel model = TaskModel(
          userId: FirebaseAuth.instance.currentUser?.uid ?? "",
          title: titleController.text,
          description: descriptionController.text,
          date: DateUtils
              .dateOnly(selectedDate)
              .millisecondsSinceEpoch);
      FirebaseFunctions.addTask(model).then(
            (value) {
          Navigator.pop(context);
        },
      );
    }
  }
}
