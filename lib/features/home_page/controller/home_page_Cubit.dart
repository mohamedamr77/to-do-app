import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/features/home_page/controller/home_page_state.dart';
import '../../../core/box.dart';
import '../../../core/data/model/task_model.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitialState());
   void Function()? onTap;
  // Fetch all tasks and update the state
  void fetchAllTasks() async {
    try {
      var notesBox = Hive.box<TaskModel>(BoxApp.kTaskBox);
      List<TaskModel> tasks = notesBox.values.toList();
      List<TaskModel> tasksNotArchive =tasks.where((notArchiveTask) => notArchiveTask.archivedTask == false).toList();
          if (tasksNotArchive.isNotEmpty) {
        emit(HomeScreenNotesIsFound( tasksNotArchive: tasksNotArchive)); // Pass the list of tasks to the state
      } else {
        emit(HomeScreenNotesNotFound());
      }
    } catch (e) {
      emit(HomeScreenNotesNotFound());
      debugPrint('Error fetching tasks: $e');
    }
  }



}
