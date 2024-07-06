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
    return SingleChildScrollView(
      child: Padding(
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
               Card(
                 color: Colors.white,
                 child: ListTile(
                   onTap: (){

                   },
                   leading: SvgPicture.asset("assets/images/svg/calendar.svg"),
                   title: Text("Start Date",
                   style: TextStyle(
                     color: Color(0xff423F3F),
                     fontSize: 14,
                     fontWeight: FontWeight.w400,
                     fontFamily: "LexendDecaRegularStyle",
                   ),
                   ),
                   subtitle: Text("Enter The Start Date",
                   style: TextStyle(
                     color: Color(0xffB6B4BD),
                     fontSize: 12,
                     fontWeight: FontWeight.w400,
                     fontFamily: "LexendDecaRegularStyle",
                   ),
                   ),
                   trailing: SvgPicture.asset("assets/images/svg/Arrow - Down .svg"),
                 ),
               ),
               Card(
                 color: Colors.white,
                 child: ListTile(
                   onTap: (){

                   },
                   leading: SvgPicture.asset("assets/images/svg/calendar.svg"),
                   title: Text("End Date",
                     style: TextStyle(
                       color: Color(0xff423F3F),
                       fontSize: 14,
                       fontWeight: FontWeight.w400,
                       fontFamily: "LexendDecaRegularStyle",
                     ),
                   ),
                   subtitle: Text("Enter The End Date",
                     style: TextStyle(
                       color: Color(0xffB6B4BD),
                       fontSize: 12,
                       fontWeight: FontWeight.w400,
                       fontFamily: "LexendDecaRegularStyle",
                     ),
                   ),
                   trailing: SvgPicture.asset("assets/images/svg/Arrow - Down .svg"),
                 ),
               ),
               Card(
                 color: Colors.white,
                 child: ListTile(
                   onTap: (){

                   },
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
                       color: Color(0xffB6B4BD),
                       fontSize: 12,
                       fontWeight: FontWeight.w400,
                       fontFamily: "LexendDecaRegularStyle",
                     ),
                   ),
                   trailing: SvgPicture.asset("assets/images/svg/Arrow - Down .svg"),
                 ),
               ),
               SizedBox(height: 20,),
               GestureDetector(
                 onTap: (){},
                 child: Container(
                   padding: EdgeInsets.symmetric(vertical: 12),
                   width: double.infinity,
                   decoration: BoxDecoration(
                     color: Color(0xff90B6E2),
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Text("Add Task",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 18,
                     fontWeight: FontWeight.w600,
                     fontFamily: "LexendDeca",
                   ),
                   ),
                 ),
               )
             ],
          ),
        ),
      ),
    );
  }
}

