import 'package:animate_do/animate_do.dart';
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

  final GlobalKey<AnimatedListState>  key=GlobalKey();

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
                    child: AnimatedList(
                      key: key,
                      initialItemCount: tasks.length,
                      itemBuilder: (context, index, animation) {
                      return  SizeTransition(
                        sizeFactor: animation,
                        child: CardList(
                          taskModel: tasks[index], index: index, onTap: (){
                          deleteItem(taskModel: tasks[index], index: index);
                        },
                        ),
                      );
                    },)
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
  void deleteItem({required TaskModel taskModel, required int index}) {
    // Animate the removal of the item
    key.currentState!.removeItem(index, (context, animation) {
      return  SlideTransition(
          position: animation.drive(Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: const Offset(0.0, 1.0),
          )),
          child: CardList(taskModel: taskModel, index: index, onTap: () {}),
        );
      },
      duration: const Duration(milliseconds: 300),
    );

    // Delay updating the list to ensure the animation completes
    Future.delayed(const Duration(milliseconds: 300), () {
      BlocProvider.of<ArchivedTaskCubit>(context).updateArchive(index, taskModel);
      // After updating, refresh the tasks
      BlocProvider.of<ArchivedTaskCubit>(context).fetchAllTasks();
    });
  }

}



/*
  void deleteItem ({required  TaskModel taskModel , required int index}){

    BlocProvider.of<ArchivedTaskCubit>(context).updateArchive(index,taskModel);
    BlocProvider.of<ArchivedTaskCubit>(context).fetchAllTasks();

    key.currentState!.removeItem(index, (context, animation) {
      return SlideTransition(
      position: animation.drive(Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.5, 1.0),
      )),
      child: CardList(taskModel: taskModel, index: index, onTap: (){}));
    },
    );

  }
 */