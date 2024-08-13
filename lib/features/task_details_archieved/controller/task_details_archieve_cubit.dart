import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/features/task_details_archieved/controller/task_detials_archieve_state.dart';

import '../../../core/box.dart';
import '../../../core/data/model/task_model.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsArchieveState>{
  TaskDetailsCubit() : super(TaskDetailsArchieveInitialState());

  // Update doneTask status
  void updateArchive(int index, TaskModel taskModel) {
    var notesBox = Hive.box<TaskModel>(BoxApp.kTaskBox);
    taskModel.archivedTask = !taskModel.archivedTask;  // Toggle the doneTask status
    notesBox.putAt(index, taskModel);
  }

}