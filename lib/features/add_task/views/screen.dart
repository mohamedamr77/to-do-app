import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/features/add_task/views/widgets/add_task_body.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorApp.bgGroundColor1,
              ColorApp.bgGroundColor2,
            ],
          ),
        ),
        child: AddTaskBody(),
      ),

    );
  }
}
