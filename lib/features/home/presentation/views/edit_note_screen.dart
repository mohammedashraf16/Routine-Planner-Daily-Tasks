import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/app_colors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/core/app_colors/functions/firebase_functions.dart';
import 'package:todo_app/features/home/model/tasks_model.dart';
import 'package:todo_app/providers/app_config_provider.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  static const String routeName = "EditNote";

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as TaskModel;
    var height = MediaQuery.of(context).size.height;
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                color: AppColors.primaryColor,
                height: height * .22,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: AppColors.whiteColor,
                          )),
                      const SizedBox(width: 10),
                      Text(AppLocalizations.of(context)!.app_title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColors.whiteColor)),
                    ],
                  ),
                ),
              )
            ],
          ),
          SingleChildScrollView(
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
                    TextFormField(
                      style: TextStyle(fontSize: 22),
                      controller: titleEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Task";
                        } else {
                          return null;
                        }
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
                          AppLocalizations.of(context)!.enter_your_task,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      style: TextStyle(fontSize: 22),
                      controller: descriptionEditingController,
                      maxLines: 4,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Description";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        label: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      AppLocalizations.of(context)!.select_time,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        showDateFun();
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
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(AppColors.primaryColor)),
                        onPressed: () {
                          model.title = titleEditingController.text;
                          model.description = descriptionEditingController.text;
                          model.date = DateUtils.dateOnly(selectedDate)
                              .millisecondsSinceEpoch;
                          FirebaseFunctions.updateTasks(model);
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.add_task,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showDateFun() async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                    primary: AppColors.primaryColor,
                    onSurfaceVariant: AppColors.primaryColor,
                    onSurface: Colors.black,
                    outline: AppColors.primaryColor,
                    surface: Colors.white70),
                dividerTheme: DividerThemeData(color: AppColors.primaryColor)),
            child: child!);
      },
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}
