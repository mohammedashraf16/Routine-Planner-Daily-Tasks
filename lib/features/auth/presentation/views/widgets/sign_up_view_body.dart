import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/app_colors/app_colors.dart';
import 'package:todo_app/core/app_colors/functions/firebase_functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/alert_dialog_sign_up.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_elevated_button_sign_in.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_rich_widget.dart';
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
            CustomTextFormField(
              text: AppLocalizations.of(context)!.firstName,
              hitText: AppLocalizations.of(context)!.firstName,
              icon:  Icon(Icons.person,color: AppColors.blueColor,),
              controller: firstNameController,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              text: AppLocalizations.of(context)!.lastName,
              hitText: AppLocalizations.of(context)!.lastName,
              icon:  Icon(Icons.person,color: AppColors.blueColor,),
              controller: firstNameController,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              text: AppLocalizations.of(context)!.email,
              hitText: "hello@example.com",
              icon:  Icon(Icons.email_outlined,color: AppColors.blueColor,),
              controller: firstNameController,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              text: AppLocalizations.of(context)!.password,
              hitText: "******",
              icon:  Icon(Icons.password,color: AppColors.blueColor,),
              controller: firstNameController,
            ),
            CustomElevatedButton(
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
              emailController: emailController,
              passwordController: passwordController,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .04),
            CustomTextRichWidget(
              onTap: () {
                Navigator.pushNamed(context, SignInView.routeName);
              },
              textOne: AppLocalizations.of(context)!.haveAnAccount,
              textTwo: AppLocalizations.of(context)!.login,
            )
          ],
        ),
      ),
    );
  }
}
