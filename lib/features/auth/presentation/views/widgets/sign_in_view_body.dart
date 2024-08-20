import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/core/functions/firebase_functions.dart';
import 'package:todo_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_rich_widget.dart';
import 'package:todo_app/features/home/presentation/views/home_screen.dart';
import 'package:todo_app/providers/app_config_provider.dart';
import 'alert_dialog_sign_in.dart';
import 'custom_elevated_button_sign_in.dart';

class SignInViewBody extends StatelessWidget {
  SignInViewBody({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bool obscureText = true;
final formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider =Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                lable: AppLocalizations.of(context)!.email,
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
                obscureText: true,
                lable: AppLocalizations.of(context)!.password,
                text: AppLocalizations.of(context)!.password,
                hitText: "******",
                icon: Icon(
                  Icons.password,
                  color: AppColors.primaryColor,
                ),
                controller: passwordController,
              ),
              CustomElevatedButton(
                text: AppLocalizations.of(context)!.login,
                onPressed: () {
                  loginFun(context,provider);
                },
                emailController: emailController,
                passwordController: passwordController,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .16),
              CustomTextRichWidget(
                onTap: () {
                  Navigator.pushNamed(context, SignUpView.routeName);
                },
                textOne: AppLocalizations.of(context)!.canNotHave,
                textTwo: AppLocalizations.of(context)!.signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
  loginFun(BuildContext context,AppConfigProvider provider){
    if(formKey.currentState?.validate()==true){
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
    }
  }
}

