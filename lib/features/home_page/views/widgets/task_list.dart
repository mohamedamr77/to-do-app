import 'package:flutter/material.dart';
import 'package:todo/core/data/model/task_list.dart';
import '../../../../core/data/model/task_model.dart';
import 'dismissible_task.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    List<TaskModel> notArchiveList =tasksList.where((notArchiveTask) =>notArchiveTask.archivedTask==false ).toList();
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) {
        return DismissibleTask(
          index: index,
          title: notArchiveList[index].taskName.text ,
          subtitle: notArchiveList[index].timeOfTask,
          taskModel: notArchiveList[index]
        );
      },
      itemCount: notArchiveList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
