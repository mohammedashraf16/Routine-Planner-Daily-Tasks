import 'package:flutter/material.dart';
import 'package:todo_app/features/home/model/tasks_model.dart';
import 'package:todo_app/features/home/presentation/views/widgets/custom_app_bar_editing_task.dart';
import 'package:todo_app/features/home/presentation/views/widgets/custom_container_editing_task.dart';

class EditNoteScreen extends StatelessWidget {
  static const String routeName = "EditNote";
   EditNoteScreen({super.key});


  final TextEditingController titleEditingController = TextEditingController();
  final TextEditingController descriptionEditingController =
      TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as TaskModel;
    titleEditingController.text = model.title;
    descriptionEditingController.text = model.description;
    // DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch= model.date;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Column(
            children: [
              CustomAppBarEditingTask()
            ],
          ),
          CustomContainerEditingTask(
            model: model,
            descriptionEditingController: descriptionEditingController,
            titleEditingController: titleEditingController,
          )
        ],
      ),
    );
  }
}
