import 'package:flutter/material.dart';
import 'package:todo_app/features/auth/presentation/views/sign_up.dart';

import '../../../../../core/app_colors/app_colors.dart';

class CustomTextRichWidget extends StatelessWidget {
  const CustomTextRichWidget(
      {super.key, required this.textOne, required this.textTwo});

  final String textOne;
  final String textTwo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SignUpView.routeName);
      },
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
                text: textOne, style: Theme.of(context).textTheme.bodyMedium),
            TextSpan(
                text: textTwo,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.primaryColor)),
          ],
        ),
      ),
    );
  }
}
