import 'package:flutter/material.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/features/home/domain/model/tasks_model.dart';
import 'package:todo_app/features/home/presentation/views/widgets/custom_confirm_task_button.dart';

class CustomTaskTitleAndDescription extends StatelessWidget {
  const CustomTaskTitleAndDescription({super.key, required this.model});

  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        Container(
            height: 80,
            width: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: model.isDone == true
                    ? AppColors.greenColor
                    : AppColors.primaryColor)),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: model.isDone == true
                    ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.greenColor,
                )
                    : Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                model.description,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 15),
              ),
            ],
          ),
        ),
        model.isDone == true
            ? Text(
          "Done!",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.greenColor,
          ),
        )
            : CustomConfirmTaskButton(
          model: model,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
