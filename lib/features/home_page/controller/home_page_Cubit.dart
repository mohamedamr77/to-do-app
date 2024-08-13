import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/features/home_page/controller/home_page_state.dart';
import '../../../core/box.dart';
import '../../../core/data/model/task_model.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitialState());

  // Fetch all tasks and update the state
  void fetchAllTasks() async {
    try {
      var notesBox = Hive.box<TaskModel>(BoxApp.kTaskBox);
      List<TaskModel> tasks = notesBox.values.toList();
      List<TaskModel> tasksNotArchive = tasks.where((notArchiveTask) => notArchiveTask.archivedTask == false).toList();
      if (tasksNotArchive.isNotEmpty) {
        emit(HomeScreenNotes(tasksNotArchive: tasksNotArchive)); // Pass the list of tasks to the state
      } else {
        emit(HomeScreenNotesNotFound());
      }
    } catch (e) {
      emit(HomeScreenNotesNotFound());
      debugPrint('Error fetching tasks: $e');
    }
  }

  // Update doneTask status
  void updateDone(int index, TaskModel taskModel) {
    var notesBox = Hive.box<TaskModel>(BoxApp.kTaskBox);
    taskModel.doneTask = !taskModel.doneTask;  // Toggle the doneTask status
    notesBox.putAt(index, taskModel);
    List<TaskModel> tasks = notesBox.values.toList();
    List<TaskModel> tasksNotArchive = tasks.where((notArchiveTask) => notArchiveTask.doneTask == true).toList();
    print(tasksNotArchive.length);
    // Update the task in Hive
     emit(HomeScreenNotes(tasksNotArchive: notesBox.values.toList()));  // Emit the updated list to refresh the UI
  }
}
