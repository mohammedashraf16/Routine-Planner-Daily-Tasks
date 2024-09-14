import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/features/home/domain/providers/app_config_provider.dart';

class CustomTextFormField extends StatelessWidget {
   const CustomTextFormField({
    super.key,
    required this.text,
    required this.hitText,
    required this.icon,
    required this.controller,
    required this.lable,
    this.obscureText=false, this.validator,
  });

  final String text;
  final String lable;
  final String hitText;
  final Icon icon;
  final TextEditingController controller;
final bool obscureText;
final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: provider.isDark()
              ? Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.whiteColor)
              : Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.blackColor),
        ),
        const SizedBox(height: 10),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: hitText,
            hintStyle: const TextStyle(color: Colors.grey),
            suffixIcon: icon,
          ),
          validator: validator,
        ),
      ],
    );
  }

}
