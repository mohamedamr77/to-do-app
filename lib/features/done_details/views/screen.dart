import 'package:flutter/material.dart';
import 'package:todo/core/colorCore.dart';

import '../../../core/data/model/task_model.dart';
import 'widgets/task_done_details_body.dart';

class DoneDetailsScreen extends StatelessWidget {
  const DoneDetailsScreen({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
               ColorApp.bgGroundColor1,
               ColorApp.bgGroundColor2,
              ],
            ),
          ),
          child: TaskDoneDetailsBody(task: task,)),
    );
  }
}
