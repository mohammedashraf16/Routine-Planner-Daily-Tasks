import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color:
            provider.isDark() ? AppColors.blackDarkColor : AppColors.whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: provider.isDark()
                  ? showSelectedItem(context, AppLocalizations.of(context)!.dark)
                  : showUnSelectedItem(context, AppLocalizations.of(context)!.dark),
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: provider.isDark()
                  ? showUnSelectedItem(context, AppLocalizations.of(context)!.light)
                  : showSelectedItem(context, AppLocalizations.of(context)!.light),
            ),
          ],
        ),
      ),
    );
  }

  Widget showSelectedItem(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.primaryColor,
                )),
        Icon(Icons.done, size: 30, color: AppColors.primaryColor),
      ],
    );
  }

  Widget showUnSelectedItem(BuildContext context, String text) {
    var pro = Provider.of<AppConfigProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: pro.isDark()
              ? Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white)
              : Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.blackColor),
        ),
      ],
    );
    // Icon(Icons.done),
  }
}
