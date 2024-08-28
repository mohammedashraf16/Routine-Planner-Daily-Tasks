import 'package:flutter/material.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CustomAppBarEditingTask extends StatelessWidget {
  const CustomAppBarEditingTask({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      color: AppColors.primaryColor,
      height: height * .22,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.whiteColor,
                )),
            const SizedBox(width: 10),
            Text(AppLocalizations.of(context)!.app_title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColors.whiteColor)),
          ],
        ),
      ),
    );
  }
}
