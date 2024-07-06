import 'package:flutter/material.dart';
import 'package:todo/features/task_details/views/widgets/task_details_body.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TaskDetailsBody(),
    );
  }
}
