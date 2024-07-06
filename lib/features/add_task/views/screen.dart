import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todo/features/add_task/views/widgets/add_task_body.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key, required this.name,required this.photo});
  final String name;
  final File photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddTaskBody(
        name: name,
        photo: photo,
      ),

    );
  }
}
