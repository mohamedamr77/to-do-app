import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/core/data/model/task_model.dart';
import 'package:todo/cubit/tasks/tasks_state.dart';
import '../../core/box.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitalState());
  List<TaskModel>? tasks;
  fetchAllTasks() {
    var notesBox = Hive.box<TaskModel>(BoxApp.kTaskBox);
    tasks = notesBox.values.toList();
  }
}
