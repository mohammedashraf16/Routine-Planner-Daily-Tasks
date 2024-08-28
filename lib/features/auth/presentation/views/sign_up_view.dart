import 'package:flutter/material.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  static const String routeName = "signUp";
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: SignUpViewBody()),
    );
  }
}
