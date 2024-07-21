import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../../core/data/model/task_model.dart';
import '../../../../core/shared_widget/custom_appbar.dart';
import '../../../../core/shared_widget/custom_button.dart';
import '../../../../core/shared_widget/custom_container_show_data.dart';

class TaskDetailsAchievedBody extends StatelessWidget {
  const TaskDetailsAchievedBody({super.key, required this.taskAchieved,required this.onTap});
  final TaskModel taskAchieved;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        child: Column (
           children: [
             const CustomAppbar(title: "Task Details"),
             const SizedBox(height: 20),
             CustomContainerShowData(
               title: 'Task Name',
               detailsTitle: taskAchieved.taskName.text,
             ),
             const SizedBox(height: 16),
             CustomContainerShowData(
                 title: "Description",
                 detailsTitle: taskAchieved.taskDescriptionController.text),
             const SizedBox(height: 16),
             Card(
               color: Theme.of(context).cardColor,
               child: ListTile(
                 leading: SvgPicture.asset("assets/images/svg/calendar.svg"),
                 title:  Text(
                   "Start Date",
                   style:  Theme.of(context).textTheme.bodySmall,
                 ),
                 subtitle: Text(
                   DateFormat('dd MMM, y').format(taskAchieved.startDateSelectedDate),
                   style: const TextStyle(
                     color: Color(0xffB6B4BD),
                     fontSize: 12,
                     fontWeight: FontWeight.w400,
                     fontFamily: "LexendDecaRegularStyle",
                   ),
                 ),
               ),
             ),
             const SizedBox(height: 8),
             Card(
               color: Theme.of(context).cardColor,
               child: ListTile(
                 leading: SvgPicture.asset("assets/images/svg/calendar.svg"),
                 title:  Text(
                   "End Date",
                   style:  Theme.of(context).textTheme.bodySmall,
                 ),
                 subtitle: Text(
                   DateFormat('dd MMM, y').format(taskAchieved.startDateSelectedDate),
                   style: const TextStyle(
                     color: Color(0xffB6B4BD),
                     fontSize: 12,
                     fontWeight: FontWeight.w400,
                     fontFamily: "LexendDecaRegularStyle",
                   ),
                 ),
               ),
             ),
             const SizedBox(height: 8),
             Card(
               color: Theme.of(context).cardColor,
               child: ListTile(
                 leading:
                 Theme.of(context).canvasColor==Colors.black?
                 SvgPicture.asset("assets/images/svg/timeicon.svg") : SvgPicture.asset("assets/images/svg/fluent-emoji-flat_watch_blackmode.svg"),
                 title:  Text(
                   "Add Time",
                   style:  Theme.of(context).textTheme.bodySmall,
                 ),
                 subtitle: Text(
                   _formatTaskTime(taskAchieved.timeOfTask),
                   style: const TextStyle(
                     color: Color(0xffB6B4BD),
                     fontSize: 12,
                     fontWeight: FontWeight.w400,
                     fontFamily: "LexendDecaRegularStyle",
                   ),
                 ),

               ),
             ),
             const SizedBox(height: 15),
             CustomButton(
               backGroundColor: Theme.of(context).canvasColor==Colors.black? const Color(0xff90B6E2) :const Color(0xff3F6188),
               nameButton: 'Unarchive',
               onTap: onTap,
               image: "assets/images/svg/archievetaskIcon.svg",
             ),
             const SizedBox(height: 8),
             CustomButton(
               backGroundColor: const Color(0XFFBD5461),
               nameButton: 'Delete',
               onTap: () {
                 _showDeleteDialog(context, taskAchieved);
               },
               image: "assets/images/svg/delete_dismissible.svg",
             ),
           ],
        ),
      ),
    );
  }
  void _showDeleteDialog(BuildContext context, TaskModel task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:  const Text('Are you sure you want to delete this task?',
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
                    padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xffBD5461),
                    ),
                    child: const Text("Yes",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "LexendDeca",
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xff90B6E2),
                    ),
                    child: const Text("No",
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