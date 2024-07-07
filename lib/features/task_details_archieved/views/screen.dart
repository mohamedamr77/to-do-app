import 'package:flutter/material.dart';
import 'package:todo/core/data/model/task_model.dart';
import 'package:todo/features/task_details_archieved/views/widgets/task_details_achieved_body.dart';

class TaskDetailsAchievedScreen extends StatefulWidget {
  const TaskDetailsAchievedScreen({super.key, required this.taskModel});
     final TaskModel taskModel;

  @override
  State<TaskDetailsAchievedScreen> createState() => _TaskDetailsAchievedScreenState();
}

class _TaskDetailsAchievedScreenState extends State<TaskDetailsAchievedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
    decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: [
                Color(0xffF9FEFB),
            Color(0xffFAFAFA),
            ],
            ),
            ),
    child: TaskDetailsAchievedBody(
      taskAchieved: widget.taskModel,
      onTap: () {
      widget.taskModel.archivedTask=false;
      setState(() {});
    },),
      )
    );
  }
}
