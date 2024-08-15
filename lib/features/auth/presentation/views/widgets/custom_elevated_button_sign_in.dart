import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/app_colors/app_colors.dart';
import 'package:todo_app/core/app_colors/functions/firebase_functions.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/alert_dialog_sign_in.dart';
import 'package:todo_app/features/home/presentation/views/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../providers/app_config_provider.dart';

class CustomElevatedButtonSignIn extends StatelessWidget {
  const CustomElevatedButtonSignIn(
      {super.key,
        required this.emailController,
        required this.passwordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            FirebaseFunctions.signInWithEmailAndPassword(
                emailController.text, passwordController.text, onSuccess: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomeScreen.routeName,
                    (route) => false,
              );
            }, onError: (message) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialogSignIn(
                    provider: provider,
                    message: message,
                  ));
            });
          },
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
