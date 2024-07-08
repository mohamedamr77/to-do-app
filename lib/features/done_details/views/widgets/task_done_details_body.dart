import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/data/model/task_model.dart';
import '../../../../core/shared_widget/custom_appbar.dart';
import '../../../../core/shared_widget/custom_button.dart';
import '../../../../core/shared_widget/custom_container_show_data.dart';

class TaskDoneDetailsBody extends StatelessWidget {
  const TaskDoneDetailsBody({super.key,required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
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

            ],
          ),
        ),
      ),
    );
  }
}

String _formatTaskTime(TimeOfDay time) {
  final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
  final minute = time.minute.toString().padLeft(2, '0');
  final period = time.hour < 12 ? 'AM' : 'PM';
  return '$hour:$minute $period';
}