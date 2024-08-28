import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/features/home/presentation/views/bottom_sheets/language_bottom_sheet.dart';
import 'package:todo_app/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CustomContainerToChangeLanguage extends StatelessWidget {
  const CustomContainerToChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.language,
          style: provider.isDark()
              ? Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.whiteColor)
              : Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const LanguageBottomSheet();
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: provider.isDark()
                      ? AppColors.blackDarkColor
                      : AppColors.whiteColor,
                  border: Border.all(color: AppColors.primaryColor)),
              child: Row(
                children: [
                  Text(
                    provider.appLanguage == "en"
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
