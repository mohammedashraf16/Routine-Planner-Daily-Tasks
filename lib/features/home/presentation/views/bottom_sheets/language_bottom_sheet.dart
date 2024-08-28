import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/providers/app_config_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AppConfigProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: pro.isDark() ? AppColors.blackDarkColor : AppColors.whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                pro.changeLanguage("en");
              },
              child: pro.appLanguage == "en"
                  ? showSelectedItem(
                      context, AppLocalizations.of(context)!.english)
                  : showUnSelectedItem(
                      context, AppLocalizations.of(context)!.english),
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                pro.changeLanguage("ar");
              },
              child: pro.appLanguage == "en"
                  ? showUnSelectedItem(
                      context, AppLocalizations.of(context)!.arabic)
                  : showSelectedItem(
                      context, AppLocalizations.of(context)!.arabic),
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
        Text(
          text,
          style:Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.primaryColor),
        ),
        Icon(
          Icons.done,
          size: 30,
          color: AppColors.primaryColor,
        ),
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
                  ?.copyWith(color: AppColors.whiteColor)
              : Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.blackColor),
        ),
      ],
    );
    // Icon(Icons.done),
  }
}
