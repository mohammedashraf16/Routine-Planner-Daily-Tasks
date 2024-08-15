import 'package:flutter/material.dart';
import 'package:todo_app/core/app_colors/app_colors.dart';
import 'package:todo_app/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AlertDialogSignIn extends StatelessWidget {
  const AlertDialogSignIn({
    super.key,
    required this.provider, required this.message,
  });

  final AppConfigProvider provider;
  final String message;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        AppLocalizations.of(context)!.error,
        style: Theme
            .of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: Colors.red),
      ),
      backgroundColor: provider.isDark()
          ? AppColors.blackDarkColor
          : AppColors.whiteColor,
      content: Text(
        message, style: provider.isDark() ? Theme
          .of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: AppColors.whiteColor):Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: AppColors.blackColor),),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                WidgetStatePropertyAll(
                    AppColors.primaryColor)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              AppLocalizations.of(context)!.okay,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white)
            ))
      ],
    );
  }
}
