import 'package:flutter/material.dart';
import 'package:todo/core/data/model/task_list.dart';
import 'package:todo/core/data/model/task_model.dart';
import 'package:todo/core/shared_widget/custom_appbar.dart';
import 'package:todo/features/home_page/views/HomePageScreen.dart';
import '../../../../core/shared_widget/custom_button.dart';
import 'custom_data_picker.dart';
import 'custom_time_picker.dart';
import 'cutsom_field.dart';

class AddTaskBody extends StatelessWidget {
   AddTaskBody({super.key});

  TextEditingController tasknameControllerRegester = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();

  DateTime startDateSelectedDate = DateTime.now();
  DateTime endDateSelectedDate = DateTime.now();

   TimeOfDay selectedTime=TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SafeArea(
          child: Column(
             children: [

               SizedBox(height: 10,),

               CustomAppbar(title: "CustomAppbar"),

               SizedBox(height: 35,),

               CustomField(
                 title: 'Task Name',
                 hintText: 'Enter The Task Name',
                 minLine: 1,
                 maxLine: 1,
                 controller: tasknameControllerRegester,
               ),

               SizedBox(height: 10,),

               CustomField(
                 title: 'Description',
                 hintText: 'Enter The Task Desciption',
                 minLine: 4,
                 maxLine: 4,
                 controller: taskDescriptionController,
               ),

               SizedBox(height: 20,),

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

               SizedBox(height: 20,),

               CustomButton(
                 backGroundColor: Color(0xff90B6E2),
                 nameButton: "Add Task",
                 onTap: () {
                      tasksList.add(TaskModel(
                              tasknameControllerRegester: tasknameControllerRegester,
                              taskDescriptionController: taskDescriptionController,
                              startDateSelectedDate: startDateSelectedDate,
                              endDateSelectedDate: endDateSelectedDate,
                              timeOfTask: selectedTime,
                          ));
                       Navigator.pop(context,true);
                       print(tasksList.length);
                   },
               )
             ],
          ),
        ),
      ),
    );
  }
}