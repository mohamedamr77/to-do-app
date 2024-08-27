import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/features/done_tasks/views/controller/done_task_state.dart';

import '../../../../core/box.dart';
import '../../../../core/data/model/task_model.dart';

class DoneTaskCubit extends Cubit<DoneTaskState> {
  DoneTaskCubit() : super(DoneTaskInitialState());
  void fetchAllTasks() async {
    try {
      var notesBox = Hive.box<TaskModel>(BoxApp.kTaskBox);
      List<TaskModel> tasks = notesBox.values.toList();
      List<TaskModel> tasksDone =
          tasks.where((doneTask) => doneTask.doneTask == true).toList();
      if (tasksDone.isNotEmpty) {
        emit(DoneTaskNotesFoundState(tasksDone: tasksDone));
      } else {
        emit(DoneTaskNotesNotFoundState());
      }
    } catch (e) {
      print("Error: $e"); // Handle the error
    }
  }
}
