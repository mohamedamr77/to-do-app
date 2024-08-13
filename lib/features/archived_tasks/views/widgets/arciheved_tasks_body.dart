import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/core/shared_widget/custom_appbar.dart';
import 'package:todo/core/textCore.dart';
import 'package:todo/features/archived_tasks/controller/archived_task_cubit.dart';
import 'package:todo/features/archived_tasks/controller/archived_task_state.dart';
import 'package:todo/features/archived_tasks/views/widgets/body_not_found_archived_tasks.dart';
import 'package:todo/features/archived_tasks/views/widgets/card_list.dart';
import '../../../../core/data/model/task_list.dart';
import '../../../../core/data/model/task_model.dart';

class ArcihevedTasksBody extends StatefulWidget {
  const ArcihevedTasksBody({super.key});

  @override
  State<ArcihevedTasksBody> createState() => _ArcihevedTasksBodyState();
}
class _ArcihevedTasksBodyState extends State<ArcihevedTasksBody> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ArchivedTaskCubit>(context).fetchAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ArchivedTaskCubit, ArchivedTaskState>(
      builder: (context, state) {
        if(state is ArchivedTaskNotesFoundState) {
          List<TaskModel> tasks=state.tasksArchived;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Column(
                children: [
                  const CustomAppbar(title: TextApp.archiveText),
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => CardList(
                        taskModel: tasks[index], index: index,
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: tasks.length,
                    ),
                  )
                ],
              ),
            ),
          );
        } else{
          return const BodyNotFoundArchivedTasks();
        }
      },
    );
  }
}

