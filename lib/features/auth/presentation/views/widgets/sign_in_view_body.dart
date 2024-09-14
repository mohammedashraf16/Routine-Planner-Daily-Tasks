import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/base/base.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/features/auth/presentation/views/sign_in/sign_in_connector.dart';
import 'package:todo_app/features/auth/presentation/views/sign_in/sign_in_view_model.dart';
import 'package:todo_app/features/auth/presentation/views/sign_up/sign_up_view.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_rich_widget.dart';
import 'package:todo_app/features/home/domain/providers/app_config_provider.dart';
import 'custom_elevated_button_sign_in.dart';

class SignInViewBody extends StatefulWidget {
   const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends BaseView<SignInViewBody,SignInViewModel> implements SignInConnector{
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final bool obscureText = true;

final formKey =GlobalKey<FormState>();
@override
  void initState() {
    super.initState();
   vmObject.connector =this;
  }
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "${AppLocalizations.of(context)!.pleaseEnterYour} ${AppLocalizations.of(context)!.email}";
                  }
                    final bool emailValid =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[gmail]+\.[com]+")
                        .hasMatch(value);
                  if(!emailValid){
                    return AppLocalizations.of(context)!.please_enter_valid_email;
                  }
                  return null;

                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "${AppLocalizations.of(context)!.pleaseEnterYour} ${AppLocalizations.of(context)!.password}";
                  }
                  final bool emailValid =
                  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                      .hasMatch(value);
                  if(!emailValid){
                    return AppLocalizations.of(context)!.please_enter_valid_password;
                  }
                  return null;

                },
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
                  loginFun(context, provider);
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
      vmObject.signInWithEmailAndPassword(
          emailController.text, passwordController.text,);
    }
  }


  @override
  initMyViewModel() {
   return SignInViewModel();
  }

}

