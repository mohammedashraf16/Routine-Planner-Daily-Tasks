import 'package:flutter/material.dart';
import 'package:todo_app/core/app_colors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
        required this.emailController,
        required this.passwordController, this.onPressed});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.login,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.whiteColor),
              ),
              Icon(
                Icons.arrow_forward,
                color: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}










