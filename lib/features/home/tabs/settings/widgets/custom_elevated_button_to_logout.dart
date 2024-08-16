import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/core/functions/firebase_functions.dart';
import 'package:todo_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:todo_app/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CustomElevatedButtonToLogOut extends StatelessWidget {
  const CustomElevatedButtonToLogOut({super.key});
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.logOut,
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
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: provider.isDark()
                        ? AppColors.blackDarkColor
                        : AppColors.whiteColor,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.primaryColor))),
                onPressed: () {
                  FirebaseFunctions.signOut();
                  Navigator.pushNamed(context, SignInView.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.logOut,
                        style:
                        Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.primaryColor,
                        )),
                    Icon(
                      Icons.logout_outlined,
                      color: AppColors.primaryColor,
                    )
                  ],
                )),
          ),
        )
      ],
    );
  }
}