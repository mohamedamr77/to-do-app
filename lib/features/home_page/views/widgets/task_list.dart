import 'package:flutter/material.dart';
import 'package:todo/core/data/model/task_list.dart';
import 'dismissible_task.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) {
        return DismissibleTask(index: index);
      },
      itemCount: tasksList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
