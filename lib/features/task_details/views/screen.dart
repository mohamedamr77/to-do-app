import 'package:flutter/material.dart';
import 'package:todo/core/data/model/task_model.dart';
import 'package:todo/features/task_details/views/widgets/task_details_body.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key, required this.task});
    final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffF9FEFB),
                Color(0xffFAFAFA),
              ],
            ),
          ),
          child: TaskDetailsBody(task: task,)),
    );
  }
}
