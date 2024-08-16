import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/constant/app_colors.dart';
import 'package:todo_app/features/home/model/tasks_model.dart';
import 'package:todo_app/features/home/presentation/views/widgets/custom_elevated_button.dart';
import 'package:todo_app/features/home/presentation/views/widgets/custom_text_form_field.dart';
import 'package:todo_app/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomContainerEditingTask extends StatefulWidget {
  const CustomContainerEditingTask({
    super.key,
    required this.model,
    required this.titleEditingController,
    required this.descriptionEditingController,
  });

  final TextEditingController titleEditingController;
  final TextEditingController descriptionEditingController;
  final TaskModel model;

  @override
  State<CustomContainerEditingTask> createState() => _CustomContainerEditingTaskState();
}

class _CustomContainerEditingTaskState extends State<CustomContainerEditingTask> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: height * .7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: provider.isDark()
              ? AppColors.blackDarkColor
              : AppColors.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context)!.edit_task,
                  style: provider.isDark()
                      ? Theme.of(context).textTheme.bodyLarge
                      : Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColors.blackColor),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 15),
              CustomTextFormFieldEditingTask(
                text: AppLocalizations.of(context)!.enter_your_task,
                controller: widget.titleEditingController,
              ),
              const SizedBox(height: 30),
              CustomTextFormFieldEditingTask(
                text: AppLocalizations.of(context)!.description,
                controller: widget.descriptionEditingController,
                maxLines: 4,
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
              CustomEditingElevatedButton(
                model: widget.model,
                titleEditingController: widget.titleEditingController,
                descriptionEditingController: widget.descriptionEditingController,
                selectedDate: selectedDate,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void showDateFun(AppConfigProvider provider) async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                    primary: AppColors.primaryColor,
                    onSurfaceVariant: AppColors.primaryColor,
                    onSurface: provider.isDark()?AppColors.whiteColor: Colors.black,
                    outline: AppColors.primaryColor,
                    surface: provider.isDark()?AppColors.blackDarkColor: Colors.white70),
                dividerTheme: DividerThemeData(color: AppColors.primaryColor)),
            child: child!);
      },
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 2),
      ),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}
