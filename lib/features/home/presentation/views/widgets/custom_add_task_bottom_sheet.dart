import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/features/home/presentation/views/widgets/custom_elevated_button_add_task.dart';
import 'package:todo_app/features/home/presentation/views/widgets/custom_text_form_field_add_task_and_description.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../providers/app_config_provider.dart';
import 'custom_animated_text_kit_widget.dart';

class CustomAddTaskBottomSheet extends StatefulWidget {
   const CustomAddTaskBottomSheet({
    super.key,
    required this.titleController,
    required this.descriptionController,
    this.formKey,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final  formKey;
  @override
  State<CustomAddTaskBottomSheet> createState() =>
      _CustomAddTaskBottomSheetState();
}

class _CustomAddTaskBottomSheetState extends State<CustomAddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    var height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 15),
        const CustomAnimatedTextKitWidget(),
        const SizedBox(height: 15),
        CustomTextFormFieldAddTaskTitleAndDescription(
          controller: widget.titleController,
          lable: AppLocalizations.of(context)!.task,
          text: AppLocalizations.of(context)!.enter_your_task,
        ),
        const SizedBox(height: 30),
        CustomTextFormFieldAddTaskTitleAndDescription(
          maxLines: 4,
          controller: widget.descriptionController,
          lable: AppLocalizations.of(context)!.description,
          text: AppLocalizations.of(context)!.description,
        ),
        const SizedBox(height: 30),
        Text(
          AppLocalizations.of(context)!.select_time,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 30),
        InkWell(
          onTap: () {
            showDateFun(provider);
          },
          child: Text(
            selectedDate.toString().substring(0, 10),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.primaryColor,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: height * 0.06,
          child: CustomElevatedButtonAddTask(
            descriptionController: widget.descriptionController,
            formKey: widget.formKey,
            selectedDate: selectedDate,
            titleController: widget.titleController,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  void showDateFun(AppConfigProvider provider,) async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                    primary: AppColors.primaryColor,
                    onSurfaceVariant: AppColors.primaryColor,
                    onSurface:
                        provider.isDark() ? AppColors.whiteColor : Colors.black,
                    outline: AppColors.primaryColor,
                    surface: provider.isDark()
                        ? AppColors.blackDarkColor
                        : Colors.white70),
                dividerTheme: DividerThemeData(color: AppColors.primaryColor)),
            child: child!);
      },
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {

      });
    }
  }
}
