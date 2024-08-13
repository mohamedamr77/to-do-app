import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/data/model/task_model.dart';
import 'package:todo/features/task_details_archieved/views/widgets/task_details_achieved_body.dart';

import '../controller/task_details_archieve_cubit.dart';
class TaskDetailsAchievedScreen extends StatelessWidget {
  const TaskDetailsAchievedScreen({super.key, required this.taskModel, required this.index});
  final TaskModel taskModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => TaskDetailsArchieveCubit(),
  child: Scaffold(
        body: TaskDetailsAchievedBody(
      taskAchieved: taskModel, index: index,
    )),
);
  }
}