import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/data/model/task_model.dart';
import 'package:todo/features/task_details/views/controller/task_details_cubit.dart';
import 'package:todo/features/task_details/views/widgets/task_details_body.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key, required this.task, required this.index});

  final TaskModel task;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskDetailsCubit(),
      child: Scaffold(
        body: TaskDetailsBody(
          task: task, index: index,
        ),
      ),
    );
  }
}
/*
Container(
        width: double.infinity,
        height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffF9FEFB),
                Color(0xffFAFAFA),
              ],
            ),
          ),
          child:  TaskDetailsBody(task: task,)),
 */
