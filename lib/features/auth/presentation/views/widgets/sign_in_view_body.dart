import 'package:flutter/material.dart';
import 'package:todo_app/core/app_colors/app_colors.dart';
import 'package:todo_app/core/app_colors/functions/firebase_functions.dart';
import 'package:todo_app/features/home/presentation/views/home_screen.dart';

import '../sign_up.dart';

class SignInViewBody extends StatelessWidget {
  SignInViewBody({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
              "Login",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Welcome back to the app!",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 50),
            Text(
              "Email Address",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.whiteColor),
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
                    Icons.lock_outline_rounded,
                    color: AppColors.primaryColor,
                  )),
            ),
            const SizedBox(height: 50),
            Text(
              "Password",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.whiteColor),
            ),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  hintText: "******",
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: Icon(
                    Icons.password,
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
                    FirebaseFunctions.signInWithEmailAndPassword(
                      emailController.text,
                      passwordController.text,
                      onSuccess: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomeScreen.routeName,
                          (route) => false,
                        );
                      },
                      onError: (message){
                        showDialog(context: context, builder: (context)=>AlertDialog(
                          title: const Text("Error"),
                          content: Text(message),
                          actions: [
                            ElevatedButton(onPressed: (){}, child: Text("Okay"))
                          ],
                        ));
                      }
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        "Login",
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
            SizedBox(height: MediaQuery.of(context).size.height * .16),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SignUpView.routeName);
              },
              child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(children: [
                    TextSpan(
                        text: "Can't have an account?",
                        style: Theme.of(context).textTheme.bodyMedium),
                    TextSpan(
                        text: " SignUp",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.primaryColor)),
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
