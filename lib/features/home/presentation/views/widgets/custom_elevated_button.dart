import 'package:flutter/material.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/core/functions/firebase_functions.dart';
import 'package:todo_app/features/home/domain/model/tasks_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomEditingElevatedButton extends StatelessWidget {
  const CustomEditingElevatedButton({
    super.key,
    required this.model,
    required this.titleEditingController,
    required this.descriptionEditingController,
    required this.selectedDate,
  });

  final TaskModel model;
  final TextEditingController titleEditingController;
  final TextEditingController descriptionEditingController;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.06,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor)),
        onPressed: () {
          changeTask(model, context);
        },
        child: Text(
          AppLocalizations.of(context)!.saveChanges,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.whiteColor,
              ),
        ),
      ),
    );
  }

  Future<void> changeTask(TaskModel model, BuildContext context) async{
    model.title = titleEditingController.text;
    model.description = descriptionEditingController.text;
    model.date = DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch;
   await FirebaseFunctions.updateTasks(model);
    Navigator.pop(context);
  }
}
