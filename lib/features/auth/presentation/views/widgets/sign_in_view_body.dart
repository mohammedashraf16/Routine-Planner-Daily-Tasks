import 'package:flutter/material.dart';
import 'package:todo_app/core/app_colors/app_colors.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_rich_widget.dart';
import 'custom_elevated_button_sign_in.dart';

class SignInViewBody extends StatelessWidget {
  SignInViewBody({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .2),
            Text(
              AppLocalizations.of(context)!.login,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              AppLocalizations.of(context)!.welcomeBack,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 50),
            CustomTextFormField(
              controller: emailController,
              text: AppLocalizations.of(context)!.email,
              icon: Icon(
                Icons.email_outlined,
                color: AppColors.primaryColor,
              ),
              hitText: "hello@example.com",
            ),
            const SizedBox(height: 50),
            CustomTextFormField(
              text: AppLocalizations.of(context)!.password,
              hitText: "******",
              icon: Icon(
                Icons.password,
                color: AppColors.primaryColor,
              ),
              controller: passwordController,
            ),
            CustomElevatedButtonSignIn(
              emailController: emailController,
              passwordController: passwordController,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .16),
            CustomTextRichWidget(
              textOne: AppLocalizations.of(context)!.canNotHave,
              textTwo: AppLocalizations.of(context)!.signUp,
            ),
          ],
        ),
      ),
    );
  }
}

