
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/data/model/task_model.dart';
import 'package:todo/core/fontfamily.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/shared_widget/custom_appbar.dart';
import 'package:todo/core/textCore.dart';
import '../../../../core/shared_widget/custom_button.dart';
import '../../../../core/shared_widget/custom_container_show_data.dart';

class TaskDetailsBody extends StatefulWidget {
  const TaskDetailsBody({super.key, required this.task});
  final TaskModel task;


  @override
  State<TaskDetailsBody> createState() => _TaskDetailsBodyState();
}

class _TaskDetailsBodyState extends State<TaskDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            children: [
              const CustomAppbar(title: TextApp.taskDetailsText),
              const SizedBox(height: 20),
              CustomContainerShowData(
                title: TextApp.taskNameText,
                detailsTitle: widget.task.taskName.text,
              ),
              const SizedBox(height: 16),
              CustomContainerShowData(
                  title: TextApp.descriptionText,
                  detailsTitle: widget.task.taskDescriptionController.text),
              const SizedBox(height: 16),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: SvgPicture.asset(ImageApp.calendarImage),
                  title:  const Text(
                    TextApp.startDateText,
                    style: TextStyle(
                      color: Color(0xff423F3F),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamilyApp.lexendDecaRegular
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('dd MMM, y').format(widget.task.startDateSelectedDate),
                    style: const TextStyle(
                      color: Color(0xffB6B4BD),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamilyApp.lexendDecaRegular,
                    ),
                  ),

                ),
              ),
              const SizedBox(height: 8),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: SvgPicture.asset(ImageApp.calendarImage),
                  title: const Text(
                    TextApp.endDateText,
                    style: TextStyle(
                      color: Color(0xff423F3F),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily:  FontFamilyApp.lexendDecaRegular,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('dd MMM, y').format(widget.task.startDateSelectedDate),
                    style: const TextStyle(
                      color: Color(0xffB6B4BD),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily:  FontFamilyApp.lexendDecaRegular,
                    ),
                  ),

                ),
              ),
              const SizedBox(height: 8),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: SvgPicture.asset(ImageApp.calendarImage),
                  title: const Text(
                    TextApp.addTimeText,
                    style: TextStyle(
                      color: Color(0xff423F3F),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily:  FontFamilyApp.lexendDecaRegular,
                    ),
                  ),
                  subtitle: Text(
                    _formatTaskTime(widget.task.timeOfTask),
                    style: const TextStyle(
                      color: Color(0xffB6B4BD),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily:  FontFamilyApp.lexendDecaRegular,
                    ),
                  ),

                ),
              ),
              const SizedBox(height: 15),
              CustomButton(
                backGroundColor: const Color(0XFF90B6E2),
                nameButton: TextApp.archiveText,
                onTap: () {
                  widget.task.archivedTask = true;
                  Navigator.pop(context);
                },
                image: ImageApp.archieveIcon,
              ),
              const SizedBox(height: 8),
              CustomButton(
                backGroundColor: const Color(0XFFBD5461),
                nameButton: TextApp.deleteText,
                onTap: () {
                  _showDeleteDialog(context, widget.task);
                },
                image: ImageApp.deleteIcon,
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
          content:   const Text(TextApp.areYouSureDeleteText,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: FontFamilyApp.lexendDecaRegular,
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
                     child: const Text(TextApp.yesText,
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
                       color:  ColorApp.primaryColor,
                     ),
                     child:  const Text(TextApp.noText,
                       style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.w600,
                           fontFamily: FontFamilyApp.lexendDecaSemiBold,
                           color:ColorApp.whiteColor,
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
  final period = time.hour < 12 ? TextApp.amText : TextApp.pmText;
  return '$hour:$minute $period';
}
