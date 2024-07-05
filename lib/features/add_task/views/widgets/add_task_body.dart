import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'cutsom_field.dart';

class AddTaskBody extends StatefulWidget {
  const AddTaskBody({super.key});

  @override
  State<AddTaskBody> createState() => _AddTaskBodyState();
}

class _AddTaskBodyState extends State<AddTaskBody> {

  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: SafeArea(
        child: Column(
           children: [
             SizedBox(height: 10,),
             Row(
               children: [
                 GestureDetector(
                   onTap: (){
                     Navigator.of(context).pop();
                   },
                   child: SvgPicture.asset(
                     "assets/images/svg/Arrow - Left.svg",
                     height: 30,
                     width: 30,
                   ),
                 ),
                 Expanded(
                   child: Text("Add Task",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                         fontWeight: FontWeight.w600,
                         fontFamily: "LexendDeca",
                         fontSize: 19,
                         color: Color(0xff24252C)
                     ),
                   ),
                 ),
               ],
             ),
             SizedBox(height: 60,),
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
           ],
        ),
      ),
    );
  }
}

