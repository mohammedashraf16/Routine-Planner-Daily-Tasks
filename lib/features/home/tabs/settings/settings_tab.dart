import 'package:flutter/material.dart';
import 'package:todo_app/features/home/tabs/settings/widgets/custom_container_to_change_language.dart';
import 'package:todo_app/features/home/tabs/settings/widgets/custom_container_to_change_theme.dart';
import 'package:todo_app/features/home/tabs/settings/widgets/custom_elevated_button_to_logout.dart';

class SettingsTap extends StatelessWidget {
  const SettingsTap({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomContainerToChangeLanguage(),
          CustomContainerToChangeTheme(),
          CustomElevatedButtonToLogOut(),
        ],
      ),
    );
  }
}


