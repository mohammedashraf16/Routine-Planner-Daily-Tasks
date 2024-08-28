import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/core/functions/firebase_functions.dart';
import 'package:todo_app/features/home/model/tasks_model.dart';
import 'package:todo_app/features/home/presentation/views/edit_note_screen.dart';
import 'package:todo_app/features/home/presentation/views/widgets/custom_task_title_and_description.dart';


class CustomSlidableWidget extends StatelessWidget {
  const CustomSlidableWidget({super.key, required this.model});

  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: .5,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              FirebaseFunctions.deleteTasks(model.id);
            },
            label: "Delete",
            backgroundColor: AppColors.redColor,
            icon: Icons.delete,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
          ),
          SlidableAction(
            onPressed: (context) {
              Navigator.pushNamed(context, EditNoteScreen.routeName,
                  arguments: model);
            },
            label: "Edit",
            backgroundColor: AppColors.primaryColor,
            icon: Icons.edit,
          )
        ],
      ),
      child: CustomTaskTitleAndDescription(
        model: model,
      ),
    );
  }
}

