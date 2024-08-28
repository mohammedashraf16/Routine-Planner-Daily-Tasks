import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/core/functions/firebase_functions.dart';
import 'package:todo_app/features/home/presentation/views/widgets/task_item.dart';
import 'package:todo_app/providers/app_config_provider.dart';

class TasksTap extends StatefulWidget {
   TasksTap({super.key});

  @override
  State<TasksTap> createState() => _TasksTapState();
}

class _TasksTapState extends State<TasksTap> {
DateTime dateTime =DateTime.now();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Container(
          height: height * 0.14,
          decoration: BoxDecoration(color: AppColors.primaryColor),
          child: CalendarTimeline(
            initialDate: dateTime,
            firstDate: DateTime.now().subtract(const Duration(days: 365 * 2)),
            lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
            onDateSelected: (date) {
              dateTime =date;
              setState(() {

              });
            },
            leftMargin: 20,
            monthColor: AppColors.blackColor,
            dayColor: AppColors.blackColor,
            activeDayColor: AppColors.whiteColor,
            activeBackgroundDayColor: Colors.white38,
            dotColor: AppColors.whiteColor,
            locale: provider.appLanguage,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFunctions.getTasks(dateTime),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    const Text("Something Wrong Error!"),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Try Again"))
                  ],
                );
              }
              var tasks = snapshot.data?.docs
                  .map(
                    (doc) => doc.data(),
                  )
                  .toList();
              if (tasks?.isEmpty ?? true) {
                return Center(
                    child: Text(
                  "No Tasks",
                  style: Theme.of(context).textTheme.bodyMedium,
                ));
              }
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
                itemCount: tasks!.length,
                itemBuilder: (context, index) {
                  return TaskItem(
                    model: tasks[index],
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
