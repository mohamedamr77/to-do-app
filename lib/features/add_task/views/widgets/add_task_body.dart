import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/shared_widget/custom_appbar.dart';
import '../../../../core/shared_widget/custom_button.dart';
import 'custom_data_picker.dart';
import 'cutsom_field.dart';

class AddTaskBody extends StatelessWidget {
   AddTaskBody({super.key});

  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();

  DateTime startDateSelectedDate = DateTime.now();
  DateTime endDateSelectedDate = DateTime.now();

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
                 controller: taskNameController,
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

               Card(
                 color: Colors.white,
                 child: ListTile(
                   onTap: (){},
                   leading: SvgPicture.asset("assets/images/svg/timeicon.svg"),
                   title: Text("Add Time",
                     style: TextStyle(
                       color: Color(0xff423F3F),
                       fontSize: 14,
                       fontWeight: FontWeight.w400,
                       fontFamily: "LexendDecaRegularStyle",
                     ),
                   ),
                   subtitle: Text("Set a Time For The Task",
                     style: TextStyle(
                       color: Color(0xffB6B4BD), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: "LexendDecaRegularStyle",
                     ),
                   ),
                   trailing: SvgPicture.asset("assets/images/svg/Arrow - Down .svg"),
                 ),
               ),
               SizedBox(height: 20,),
               CustomButton(
                 backGroundColor: Color(0xff90B6E2),
                 nameButton: "Add Task",
                 onTap: () {  },
               )
             ],
          ),
        ),
      ),
    );
  }
}

