import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/data/model/task_list.dart';
import '../../../../core/data/model/task_model.dart';
import '../../../../core/shared_widget/custom_appbar.dart';
import '../../../../core/shared_widget/custom_button.dart';
import '../../../../core/textCore.dart';
import '../../../home_page/views/HomePageScreen.dart';
import 'custom_data_picker.dart';
import 'custom_time_picker.dart';
import 'cutsom_field.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

final TextEditingController taskName = TextEditingController();
final TextEditingController taskDescriptionController = TextEditingController();

DateTime? startDateSelectedDate;
DateTime? endDateSelectedDate;
TimeOfDay? selectedTime;

final _formKey = GlobalKey<FormState>();

class _AddTaskFormState extends State<AddTaskForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: SafeArea(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(height: 10),
              const CustomAppbar(title: TextApp.addTaskText),
              const SizedBox(height: 15),
              CustomField(
                title: TextApp.taskNameText,
                hintText: TextApp.enterTheTaskNameText,
                minLine: 1,
                maxLine: 1,
                controller: taskName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return TextApp.pleaseEnterTheTaskNameText;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              CustomField(
                title: TextApp.descriptionText,
                hintText: TextApp.enterTheTaskDescText,
                minLine: 4,
                maxLine: 4,
                controller: taskDescriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return TextApp.pleaseEnterTheTaskDescText;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomDataPicker(
                title: TextApp.startText,
                subTitle: TextApp.enterTheStartDateText,
                selectedDate: startDateSelectedDate,
                onDateSelected: (DateTime picked) {
                  startDateSelectedDate = picked;
                  if (kDebugMode) {
                    print("startDate $startDateSelectedDate");
                  }
                },
              ),
              CustomDataPicker(
                title: TextApp.endDateText,
                subTitle: TextApp.enterTheEndDateText,
                selectedDate: endDateSelectedDate,
                onDateSelected: (DateTime p) {
                  endDateSelectedDate = p;
                  if (kDebugMode) {
                    print("endDate $endDateSelectedDate");
                  }
                },
              ),
              CustomTimePicker(
                selectedTime: selectedTime,
                onTimeSelected: (TimeOfDay t) {
                  selectedTime = t;
                },
                clickInButton: null,
              ),
              const SizedBox(height: 20),
              CustomButton(
                backGroundColor: Theme.of(context).canvasColor == Colors.black
                    ? const Color(0xff90B6E2)
                    : const Color(0xff3F6188),
                nameButton: TextApp.addTaskText,
                onTap: () {
                  // Check if the start date is null, set it to today's date if so
                  startDateSelectedDate ??= DateTime.now();

                  // Check if the end date is null, set it to today's date if so
                  endDateSelectedDate ??= DateTime.now();

                  // Check if the time is null, set it to the current time if so
                  selectedTime ??= TimeOfDay.now();

                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    tasksList.add(TaskModel(
                      taskName: taskName,
                      taskDescriptionController: taskDescriptionController,
                      startDateSelectedDate: startDateSelectedDate!,
                      endDateSelectedDate: endDateSelectedDate!,
                      timeOfTask: selectedTime!,
                    ));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePageScreen(),
                      ),
                    ).then((x) {
                      setState(() {});
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
