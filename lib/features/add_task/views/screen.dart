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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffF9FEFB),
              Color(0xffFAFAFA),
            ],
          ),
        ),
        child: AddTaskBody(
          name: name,
          photo: photo,
        ),
      ),

    );
  }
}
