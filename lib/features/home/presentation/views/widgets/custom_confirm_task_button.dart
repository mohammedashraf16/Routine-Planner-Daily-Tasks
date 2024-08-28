import 'package:flutter/material.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/core/functions/firebase_functions.dart';
import 'package:todo_app/features/home/model/tasks_model.dart';

class CustomConfirmTaskButton extends StatelessWidget {
  const CustomConfirmTaskButton({required this.model, super.key});

  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        model.isDone = true;
        FirebaseFunctions.updateTasks(model);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          elevation: 4,
          shadowColor: AppColors.blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
