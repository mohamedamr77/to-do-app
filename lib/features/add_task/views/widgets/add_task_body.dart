import 'package:flutter/material.dart';
import 'package:todo/features/add_task/views/widgets/add_task_form.dart';

class AddTaskBody extends StatelessWidget {
  const AddTaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: AddTaskForm(),
    );
  }
}
