import 'package:flutter/material.dart';

import '../../../../../core/constant/app_colors.dart';

class CustomTextRichWidget extends StatelessWidget {
  const CustomTextRichWidget(
      {super.key, required this.textOne, required this.textTwo, this.onTap});

  final String textOne;
  final String textTwo;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
