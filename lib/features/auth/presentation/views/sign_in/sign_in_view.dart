import 'package:flutter/material.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  static const String routeName ="SignIn";
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(child: SignInViewBody()),
    );
  }
}
