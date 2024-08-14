import 'package:flutter/material.dart';
import 'package:todo_app/core/app_colors/app_colors.dart';
import 'package:todo_app/core/app_colors/functions/firebase_functions.dart';

import '../sign_in.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
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
            SizedBox(height: MediaQuery.of(context).size.height * .12),
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
              "First Name",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.whiteColor),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: firstNameController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  hintText: "First Name",
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: Icon(
                    Icons.perm_identity_rounded,
                    color: AppColors.primaryColor,
                  )),
            ),
            const SizedBox(height: 20),
            Text(
              "Last Name",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.whiteColor),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: lastNameController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  hintText: "Last Name",
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: Icon(
                    Icons.perm_identity_rounded,
                    color: AppColors.primaryColor,
                  )),
            ),
            const SizedBox(height: 20),
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
                    Icons.email_outlined,
                    color: AppColors.primaryColor,
                  )),
            ),
            const SizedBox(height: 20),
            Text(
              "Password",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.whiteColor),
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
                        passwordController.text,
                        onSuccess: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            SignInView.routeName,
                                (route) => false,
                          );
                        },
                        onError: (message){
                          showDialog(context: context, builder: (context)=>AlertDialog(
                            title: const Text("Error"),
                            content: Text(message),
                            actions: [
                              ElevatedButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: const Text("Okay"))
                            ],
                          ));
                        }
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        "Create Account",
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
                          text: "Have an account?",
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextSpan(
                          text: " SignIn",
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
