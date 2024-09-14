import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/base/base.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/features/auth/presentation/views/sign_up/sign_up_connector.dart';
import 'package:todo_app/features/auth/presentation/views/sign_up/sign_up_view_model.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_elevated_button_sign_in.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_rich_widget.dart';
import 'package:todo_app/features/home/domain/providers/app_config_provider.dart';
import '../sign_in/sign_in_view.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends BaseView<SignUpViewBody, SignUpViewModel>
    implements SignUpConnector {
  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    vmObject.connector = this;
  }

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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "${AppLocalizations.of(context)!.pleaseEnterYour} ${AppLocalizations.of(context)!.firstName}";
                  } else {
                    return null;
                  }
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "${AppLocalizations.of(context)!.pleaseEnterYour} ${AppLocalizations.of(context)!.lastName}";
                  } else {
                    return null;
                  }
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "${AppLocalizations.of(context)!.pleaseEnterYour} ${AppLocalizations.of(context)!.email}";
                  }
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[gmail]+\.[com]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    return AppLocalizations.of(context)!
                        .please_enter_valid_email;
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "${AppLocalizations.of(context)!.pleaseEnterYour} ${AppLocalizations.of(context)!.password}";
                  }
                  final bool passwordValid = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                      .hasMatch(value);
                  if (!passwordValid) {
                    return AppLocalizations.of(context)!
                        .please_enter_valid_password;
                  }
                  return null;
                },
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
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Account Created successfully")));

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
      vmObject.createUserWithEmailAndPassword(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        emailController.text,
        passwordController.text,
      );
    }
  }

  @override
  initMyViewModel() {
    return SignUpViewModel();
  }
}
