import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app_colors.dart';
import 'package:todo_app/features/bottom_sheets/add_task_bottom_sheet.dart';
import 'package:todo_app/features/home/tabs/settings_tab.dart';
import 'package:todo_app/features/home/tabs/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
          title: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText("To Do List", textStyle: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
                speed: const Duration(milliseconds: 500),
              ),

            ],
            totalRepeatCount: Duration.millisecondsPerSecond,
            pause: const Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 6,
        shape: StadiumBorder(
            side: BorderSide(
              width: 5,
              color: AppColors.whiteColor,
            )),
        onPressed: () {
          showModalBottomSheet(
            useSafeArea: true,
            isScrollControlled: true,
            context: context,
            builder: (context) =>
                Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom),
                  child: AddTaskBottomSheet(),
                ),
          );
        },
        child: Icon(
          Icons.add,
          color: AppColors.whiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  size: 35,
                ),
                label: "Tasks"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 35,
                ),
                label: "Settings"),
          ],
        ),
      ),
      body: tabs[currentIndex],
    );
  }

  List<Widget> tabs = [
    const TasksTap(),
    const SettingsTap(),
  ];
}
