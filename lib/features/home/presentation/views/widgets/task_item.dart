import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/features/home/domain/model/tasks_model.dart';
import 'package:todo_app/features/home/presentation/views/widgets/custom_slidable_widget.dart';
import 'package:todo_app/features/home/domain/providers/app_config_provider.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({required this.model, super.key});

  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: height * 0.16,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: provider.isDark()
              ? AppColors.blackDarkColor
              : AppColors.whiteColor,
          boxShadow: const [
            BoxShadow(
                color: Colors.black54,
                blurStyle: BlurStyle.outer,
                offset: Offset(2, 1.8))
          ]),
      child: CustomSlidableWidget(
        model: model,
      ),
    );
  }
}
