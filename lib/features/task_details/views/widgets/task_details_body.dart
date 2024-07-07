import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/data/model/task_model.dart';
import 'package:todo/core/shared_widget/custom_appbar.dart';
import '../../../../core/colorCore.dart';
import '../../../../core/shared_widget/custom_button.dart';
import '../../../home_page/views/widgets/dialog_buttons.dart';
import '../../../../core/shared_widget/custom_container_show_data.dart';

class TaskDetailsBody extends StatelessWidget {
  const TaskDetailsBody({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            children: [
              const CustomAppbar(title: "Task Details"),
              const SizedBox(height: 20),
              CustomContainerShowData(
                title: 'Task Name',
                detailsTitle: task.taskName.text,
              ),
              const SizedBox(height: 16),
              CustomContainerShowData(
                  title: "Description",
                  detailsTitle: task.taskDescriptionController.text),
              const SizedBox(height: 16),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: SvgPicture.asset("assets/images/svg/calendar.svg"),
                  title: const Text(
                    "Start Date",
                    style: TextStyle(
                      color: Color(0xff423F3F),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "LexendDecaRegularStyle",
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('dd MMM, y').format(task.startDateSelectedDate),
                    style: const TextStyle(
                      color: Color(0xffB6B4BD),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: "LexendDecaRegularStyle",
                    ),
                  ),
                  trailing: SvgPicture.asset("assets/images/svg/Arrow - Down .svg"),
                ),
              ),
              const SizedBox(height: 8),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: SvgPicture.asset("assets/images/svg/calendar.svg"),
                  title: const Text(
                    "End Date",
                    style: TextStyle(
                      color: Color(0xff423F3F),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "LexendDecaRegularStyle",
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('dd MMM, y').format(task.startDateSelectedDate),
                    style: const TextStyle(
                      color: Color(0xffB6B4BD),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: "LexendDecaRegularStyle",
                    ),
                  ),
                  trailing: SvgPicture.asset("assets/images/svg/Arrow - Down .svg"),
                ),
              ),
              const SizedBox(height: 8),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: SvgPicture.asset("assets/images/svg/calendar.svg"),
                  title: const Text(
                    "Add Time",
                    style: TextStyle(
                      color: Color(0xff423F3F),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "LexendDecaRegularStyle",
                    ),
                  ),
                  subtitle: Text(
                    _formatTaskTime(task.timeOfTask),
                    style: const TextStyle(
                      color: Color(0xffB6B4BD),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: "LexendDecaRegularStyle",
                    ),
                  ),
                  trailing: SvgPicture.asset("assets/images/svg/Arrow - Down .svg"),
                ),
              ),
              const SizedBox(height: 15),
              CustomButton(
                backGroundColor: const Color(0XFF90B6E2),
                nameButton: 'Archive',
                onTap: () {
                  task.archivedTask = true;
                },
                image: "assets/images/svg/archievetaskIcon.svg",
              ),
              const SizedBox(height: 8),
              CustomButton(
                backGroundColor: const Color(0XFFBD5461),
                nameButton: 'Delete',
                onTap: () {
                  _showDeleteDialog(context, task);
                },
                image: "assets/images/svg/dele_dismissible.svg",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, TaskModel task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:  Text('Are you sure you want to delete this task?',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: "LexendDeca",
            fontSize: 16
          ),
          ),
          actions: <Widget>[
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 GestureDetector(
                   onTap: (){
                     Navigator.of(context).pop();
                   },
                   child: Container(
                     padding: EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(6),
                       color: Color(0xffBD5461),
                     ),
                     child: Text("Yes",
                       style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.w600,
                           fontFamily: "LexendDeca",
                           color: Colors.white
                       ),
                     ),
                   ),
                 ),
                 SizedBox(width: 10,),
                 GestureDetector(
                   onTap: (){
                     Navigator.of(context).pop();
                   },
                   child: Container(
                     padding: EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(6),
                       color: Color(0xff90B6E2),
                     ),
                     child: Text("No",
                       style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.w600,
                           fontFamily: "LexendDeca",
                           color: Colors.white
                       ),
                     ),
                   ),
                 ),
               ],
             )
          ],
        );
      },
    );
  }
}

String _formatTaskTime(TimeOfDay time) {
  final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
  final minute = time.minute.toString().padLeft(2, '0');
  final period = time.hour < 12 ? 'AM' : 'PM';
  return '$hour:$minute $period';
}
