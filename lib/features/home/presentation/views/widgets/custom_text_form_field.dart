import 'package:flutter/material.dart';
import 'package:todo_app/core/constant/app_colors.dart';
class CustomTextFormFieldEditingTask extends StatelessWidget {
   CustomTextFormFieldEditingTask({super.key, required this.text, this.maxLines=1,required this.controller});
 TextEditingController controller =TextEditingController();
final String text;
final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 22),
      controller: controller,
      maxLines: maxLines,
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
}
