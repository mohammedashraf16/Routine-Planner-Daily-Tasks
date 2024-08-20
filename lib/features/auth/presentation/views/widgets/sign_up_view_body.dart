import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/core/functions/firebase_functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/alert_dialog_sign_up.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_elevated_button_sign_in.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_rich_widget.dart';
import 'package:todo_app/providers/app_config_provider.dart';
import '../sign_in_view.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                lable: AppLocalizations.of(context)!.firstName,
                text: AppLocalizations.of(context)!.firstName,
                hitText: AppLocalizations.of(context)!.firstName,
                icon: Icon(
                  Icons.person,
                  color: AppColors.blueColor,
                ),
                controller: firstNameController,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                lable: AppLocalizations.of(context)!.lastName,
                text: AppLocalizations.of(context)!.lastName,
                hitText: AppLocalizations.of(context)!.lastName,
                icon: Icon(
                  Icons.person,
                  color: AppColors.blueColor,
                ),
                controller: lastNameController,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                lable: AppLocalizations.of(context)!.email,
                text: AppLocalizations.of(context)!.email,
                hitText: "hello@example.com",
                icon: Icon(
                  Icons.email_outlined,
                  color: AppColors.blueColor,
                ),
                controller: emailController,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                obscureText: true,
                lable: AppLocalizations.of(context)!.password,
                text: AppLocalizations.of(context)!.password,
                hitText: "******",
                icon: Icon(
                  Icons.password,
                  color: AppColors.blueColor,
                ),
                controller: passwordController,
              ),
              CustomElevatedButton(
                text: AppLocalizations.of(context)!.signUp,
                onPressed: () {
                  signUpFun(context, provider);
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
      ),
    );
  }

  signUpFun(BuildContext context, AppConfigProvider provider) {
    if (formKey.currentState?.validate() == true) {
      FirebaseFunctions.createUserWithEmailAndPassword(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        emailController.text,
        passwordController.text,
        onSuccess: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            SignInView.routeName,
            (route) => false,
          );
        },
        onError: (message) {
          showDialog(
            context: context,
            builder: (context) => AlertDialogSignUp(
              provider: provider,
              message: message,
            ),
          );
        },
      );
    }
  }
}
