import 'dart:io';
import 'package:flutter/material.dart';
import 'package:todo/core/data/model/task_list.dart';
import 'package:todo/core/data/model/task_model.dart';
import 'package:todo/core/shared_widget/custom_appbar.dart';
import 'package:todo/features/home_page/views/HomePageScreen.dart';
import '../../../../core/colorCore.dart';
import '../../../../core/shared_widget/custom_button.dart';
import '../../../../core/textCore.dart';
import 'custom_data_picker.dart';
import 'custom_time_picker.dart';
import 'cutsom_field.dart';


class AddTaskBody extends StatefulWidget {
  const AddTaskBody({super.key});

  @override
  State<AddTaskBody> createState() => _AddTaskBodyState();
}

class _AddTaskBodyState extends State<AddTaskBody> {
  final TextEditingController taskName = TextEditingController();

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
                const CustomAppbar(title: TextApp.addTaskText),
                const SizedBox(height: 35,),

                CustomField(
                  title:TextApp.taskNameText,
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

                const SizedBox(height: 10,),

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

                const SizedBox(height: 20,),

                CustomDataPicker(
                  title: TextApp.startText,
                  subTitle: TextApp.enterTheStartDateText,
                  selectedDate: startDateSelectedDate,
                ),

                CustomDataPicker(
                  title: TextApp.endDateText,
                  subTitle: TextApp.enterTheEndDateText,
                  selectedDate: endDateSelectedDate,
                ),

                CustomTimePicker(selectedTime: selectedTime,),

                const SizedBox(height: 20,),

                CustomButton(
                  backGroundColor:  ColorApp.primaryColor,
                  nameButton: TextApp.addTaskText,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      tasksList.add(
                          TaskModel(
                        taskName: taskName,
                        taskDescriptionController: taskDescriptionController,
                        startDateSelectedDate: startDateSelectedDate,
                        endDateSelectedDate: endDateSelectedDate,
                        timeOfTask: selectedTime,
                      ));
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          const HomePageScreen(),
                      )
                      ).then((value) {
                        setState(() {});
                      },);

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
