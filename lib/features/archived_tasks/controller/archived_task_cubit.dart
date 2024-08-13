import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/features/archived_tasks/controller/archived_task_state.dart';
import '../../../core/box.dart';
import '../../../core/data/model/task_model.dart';

class ArchivedTaskCubit extends Cubit<ArchivedTaskState>{
  ArchivedTaskCubit() : super(ArchivedTaskInitialState());
  void fetchAllTasks() async {
    try {
      var notesBox = Hive.box<TaskModel>(BoxApp.kTaskBox);
      List<TaskModel> tasks = notesBox.values.toList();
      List<TaskModel> tasksArchived= tasks.where((archivedTask) => archivedTask.archivedTask == true).toList();
      if (tasksArchived.isNotEmpty) {
        emit(ArchivedTaskNotesFoundState(tasksArchived: tasksArchived));
      } else {
        emit(DoneTaskNotesNotFoundState());
      }
    } catch (e) {
      print("Error: $e");// Handle the error

    }
  }

}