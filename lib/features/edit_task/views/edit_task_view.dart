import 'package:flutter/material.dart';
import 'package:todo/features/edit_task/views/widgets/edit_task_body.dart';

import '../../../core/data/model/task_model.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key,required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditTaskBody(taskModel: taskModel,),
    );
  }
}
