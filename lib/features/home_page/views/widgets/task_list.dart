import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/core/data/model/task_list.dart';
import 'package:todo/cubit/tasks/tasks_cubit.dart';
import 'package:todo/cubit/tasks/tasks_state.dart';
import '../../../../core/data/model/task_model.dart';
import 'dismissible_task.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    // List<TaskModel> notArchiveList = tasksList.where((notArchiveTask) => notArchiveTask.archivedTask == false).toList();
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        List<TaskModel> tasks=BlocProvider.of<TasksCubit>(context).tasks??[];
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) {
            return DismissibleTask(
                index: index,
                taskModel: tasks[index],
            );
          },
          itemCount: tasks.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        );
      },
    );
  }
}
/*
Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Not Item's Now \n Click Bottom And Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                  fontSize: 16,
                  fontFamily: "jejuhallasan",
                ),
              ),
              Lottie.asset(
                "assets/images/lottie/see_down.json",
                width: 300,
                height: 300,
              ),
              const SizedBox(
                height: 60,
              )
            ],
          )
 */