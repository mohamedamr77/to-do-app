import 'package:flutter/material.dart';
import 'package:todo/core/shared_widget/custom_appbar.dart';

class TaskDetailsBody extends StatelessWidget {
  const TaskDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical:10),
        child: Column(
          children: [
            CustomAppbar(title: "Task Details"),
          ],
        ),
      ),
    );
  }
}
