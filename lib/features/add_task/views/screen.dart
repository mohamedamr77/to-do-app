import 'package:flutter/material.dart';
import 'package:todo/features/add_task/views/widgets/add_task_body.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddTaskBody(),
    );
  }
}
