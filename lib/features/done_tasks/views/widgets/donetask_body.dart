import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/core/textCore.dart';
import 'package:todo/features/done_tasks/views/controller/done_task_cubit.dart';
import 'package:todo/features/done_tasks/views/controller/done_task_state.dart';
import '../../../../core/data/model/task_list.dart';
import '../../../../core/data/model/task_model.dart';
import '../../../../core/shared_widget/custom_appbar.dart';
import 'body_not_found_done_tasks.dart';
import 'card_done_list.dart';

class DoneTaskBody extends StatefulWidget {
  const DoneTaskBody({super.key});

  @override
  State<DoneTaskBody> createState() => _DoneTaskBodyState();
}

class _DoneTaskBodyState extends State<DoneTaskBody> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<DoneTaskCubit>(context).fetchAllTasks();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<DoneTaskCubit, DoneTaskState>(
      builder: (context, state) {
        if(state is DoneTaskNotesFoundState) {
          List<TaskModel> tasks=state.tasksDone;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Column(
                children: [
                  const CustomAppbar(title: TextApp.doneTasksText),
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => CardDoneList(
                        taskModel: tasks[index],
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
          return const BodyNotFoundDoneTasks();
        }
      },
    );
  }
}
