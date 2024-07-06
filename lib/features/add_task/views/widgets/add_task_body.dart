import 'package:flutter/material.dart';
import 'package:todo/core/data/model/task_list.dart';
import 'package:todo/core/data/model/task_model.dart';
import 'package:todo/core/shared_widget/custom_appbar.dart';
import '../../../../core/shared_widget/custom_button.dart';
import 'custom_data_picker.dart';
import 'custom_time_picker.dart';
import 'cutsom_field.dart';


class AddTaskBody extends StatelessWidget {
  AddTaskBody({super.key});

  final TextEditingController tasknameControllerRegester = TextEditingController();
  final TextEditingController taskDescriptionController = TextEditingController();
  final DateTime startDateSelectedDate = DateTime.now();
  final DateTime endDateSelectedDate = DateTime.now();
  final TimeOfDay selectedTime = TimeOfDay.now();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 10,),
                const CustomAppbar(title: "Add Task"),
                const SizedBox(height: 35,),

                CustomField(
                  title: 'Task Name',
                  hintText: 'Enter The Task Name',
                  minLine: 1,
                  maxLine: 1,
                  controller: tasknameControllerRegester,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a task name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10,),

                CustomField(
                  title: 'Description',
                  hintText: 'Enter The Task Description',
                  minLine: 4,
                  maxLine: 4,
                  controller: taskDescriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a task description';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20,),

                CustomDataPicker(
                  title: 'Start Date',
                  subTitle: 'Enter The Start Date',
                  selectedDate: startDateSelectedDate,
                ),

                CustomDataPicker(
                  title: 'End Date',
                  subTitle: 'Enter The End Date',
                  selectedDate: endDateSelectedDate,
                ),

                CustomTimePicker(selectedTime: selectedTime,),

                const SizedBox(height: 20,),

                CustomButton(
                  backGroundColor: const Color(0xff90B6E2),
                  nameButton: "Add Task",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      tasksList.add(TaskModel(
                        tasknameControllerRegester: tasknameControllerRegester,
                        taskDescriptionController: taskDescriptionController,
                        startDateSelectedDate: startDateSelectedDate,
                        endDateSelectedDate: endDateSelectedDate,
                        timeOfTask: selectedTime,
                      ));
                      Navigator.pop(context, true);
                      print(tasksList.length);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
