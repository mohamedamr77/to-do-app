import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/features/task_details/views/controller/task_details_state.dart';

import '../../../../core/box.dart';
import '../../../../core/data/model/task_model.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit() : super(TaskDetailsInitalState());

  // Update doneTask status
  void updateArchive(TaskModel taskModel) {
    var notesBox = Hive.box<TaskModel>(BoxApp.kTaskBox);
    final index =
        notesBox.values.toList().indexWhere((task) => task.id == taskModel.id);
    if (index == -1) {
      return;
    }
    taskModel.archivedTask =
        !taskModel.archivedTask; // Toggle the doneTask status
    notesBox.putAt(index, taskModel);
  }
}

/*
   // List<TaskModel> tasks = notesBox.values.toList();
    // List<TaskModel> tasksNotArchive = tasks.where((archivedTask) => archivedTask.archivedTask == true).toList();
    // print(tasksNotArchive.length);
 */
