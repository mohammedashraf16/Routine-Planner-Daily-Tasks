import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/app_colors/app_colors.dart';
import 'package:todo_app/core/app_colors/functions/firebase_functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/alert_dialog_sign_up.dart';
import 'package:todo_app/providers/app_config_provider.dart';
import '../sign_in.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .12),
            Text(
              AppLocalizations.of(context)!.signUp,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              AppLocalizations.of(context)!.welcomeBack,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 50),
            Text(
              AppLocalizations.of(context)!.firstName,
              style: provider.isDark()?Theme
                  .of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.whiteColor):Theme
                  .of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.blackColor),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: firstNameController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.firstName,
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: Icon(
                    Icons.perm_identity_rounded,
                    color: AppColors.primaryColor,
                  )),
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.lastName,
              style: provider.isDark()?Theme
                  .of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.whiteColor):Theme
                  .of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.blackColor),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: lastNameController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.lastName,
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: Icon(
                    Icons.perm_identity_rounded,
                    color: AppColors.primaryColor,
                  )),
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.email,
              style: provider.isDark()?Theme
                  .of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.whiteColor):Theme
                  .of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.blackColor),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  hintText: "hello@example.com",
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.primaryColor,
                  )),
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.password,
              style: provider.isDark()?Theme
                  .of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.whiteColor):Theme
                  .of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.blackColor),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  hintText: "******",
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.primaryColor,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3598DB),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    FirebaseFunctions.createUserWithEmailAndPassword(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        emailController.text,
                        passwordController.text, onSuccess: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        SignInView.routeName,
                        (route) => false,
                      );
                    }, onError: (message) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialogSignUp(
                                provider: provider,
                                message: message,
                              ));
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.createAccount,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.whiteColor),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.whiteColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(children: [
                      TextSpan(
                          text: AppLocalizations.of(context)!.haveAnAccount,
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextSpan(
                          text: AppLocalizations.of(context)!.login,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.primaryColor)),
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

