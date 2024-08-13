import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/features/task_details/views/controller/task_details_state.dart';

import '../../../../core/box.dart';
import '../../../../core/data/model/task_model.dart';
import '../../../home_page/controller/home_page_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState>{
  TaskDetailsCubit() : super(TaskDetailsInitalState());

  // Update doneTask status
  void updateArchive(int index, TaskModel taskModel) {
    var notesBox = Hive.box<TaskModel>(BoxApp.kTaskBox);
    taskModel.archivedTask = !taskModel.archivedTask;  // Toggle the doneTask status
    notesBox.putAt(index, taskModel);
    // List<TaskModel> tasks = notesBox.values.toList();
    // List<TaskModel> tasksNotArchive = tasks.where((archivedTask) => archivedTask.archivedTask == true).toList();
    // print(tasksNotArchive.length);
  }

}