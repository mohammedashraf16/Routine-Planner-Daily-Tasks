import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/app_colors/app_colors.dart';
import 'package:todo_app/features/home/presentation/views/bottom_sheets/add_task_bottom_sheet.dart';
import 'package:todo_app/features/home/tabs/settings/settings_tab.dart';
import 'package:todo_app/features/home/tabs/tasks_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../providers/app_config_provider.dart';

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
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              currentIndex == 0
                  ? AppLocalizations.of(context)!.app_title
                  : AppLocalizations.of(context)!.settings,
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: AppColors.whiteColor),
              speed: const Duration(milliseconds: 100),
            ),
          ],
          totalRepeatCount: Duration.millisecondsPerSecond,
          pause: const Duration(milliseconds: 100),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 6,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: provider.isDark()
                ? AppColors.blackDarkColor
                : AppColors.whiteColor,
            useSafeArea: true,
            isScrollControlled: true,
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddTaskBottomSheet(),
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
          items: [
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.list,
                  size: 35,
                ),
                label: AppLocalizations.of(context)!.tasks),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.settings,
                  size: 35,
                ),
                label: AppLocalizations.of(context)!.settings),
          ],
        ),
      ),
      body: tabs[currentIndex],
    );
  }

  List<Widget> tabs = [
    TasksTap(),
    const SettingsTap(),
  ];
}
