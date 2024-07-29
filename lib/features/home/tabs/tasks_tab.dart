import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_colors.dart';
import 'package:todo_app/features/widgets/task_item.dart';
import 'package:todo_app/providers/app_config_provider.dart';

class TasksTap extends StatelessWidget {
  const TasksTap({super.key});

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Container(
          height: height*0.14,
          decoration: BoxDecoration(
            color: AppColors.primaryColor
          ),
          child: CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 365*2)),
            lastDate:DateTime.now().add(const Duration(days: 365*2)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: AppColors.blackColor,
            dayColor: AppColors.blackColor,
            activeDayColor: AppColors.whiteColor,
            activeBackgroundDayColor: Colors.white38,
            dotColor: AppColors.whiteColor,
            selectableDayPredicate: (date) => date.day != 23,
            locale: provider.appLanguage,
          ),
        ),
       const SizedBox(height: 20),
       Expanded(
         child: ListView.separated(
           separatorBuilder: (context, index) {
             return const SizedBox(height: 20);
           },
           itemCount: 20,
           itemBuilder: (context, index) {
           return const TaskItem();
         },),
       )
      ],
    );
  }
}
