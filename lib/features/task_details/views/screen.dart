import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todo/core/data/model/task_model.dart';
import 'package:todo/features/task_details/views/widgets/task_details_body.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key, required this.task, required this.name,required this.photo});
    final TaskModel task;
  final String name;
  final File photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffF9FEFB),
                Color(0xffFAFAFA),
              ],
            ),
          ),
          child: TaskDetailsBody(task: task, name: name, photo: photo,)),
    );
  }
}
