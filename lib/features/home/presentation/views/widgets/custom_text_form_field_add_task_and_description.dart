import 'package:flutter/material.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CustomTextFormFieldAddTaskTitleAndDescription extends StatelessWidget {
  const CustomTextFormFieldAddTaskTitleAndDescription({
    super.key,
    required this.controller,
    required this.lable,
    required this.text,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String lable;
  final String text;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      style: const TextStyle(fontSize: 22),
      controller: controller,
      validator: (value) {
        return validateFun(value,context);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            )),
        label: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }

  String? validateFun(String? value,BuildContext context) {
    if (value == null || value.isEmpty) {
      return "${AppLocalizations.of(context)!.pleaseEnterYour} $lable";
    } else {
      return null;
    }
  }
}
