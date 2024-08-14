import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/home_page/controller/home_page_Cubit.dart';
import 'package:todo/features/home_page/controller/home_page_state.dart';
import '../../../../core/data/model/task_model.dart';
import 'body_if_not_found_task.dart';
import 'dismissible_task.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    // List<TaskModel> notArchiveList = tasksList.where((notArchiveTask) => notArchiveTask.archivedTask == false).toList();
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
          if(state is HomeScreenNotes)
           {
            List<TaskModel> tasks=state.tasksNotArchive;
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
          }  else{
            return const BodyIfNotFoundTask();
          }
      },
    );
  }
}
