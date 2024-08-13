import 'package:todo/core/data/model/task_model.dart';

class HomePageState{}
class HomePageInitialState extends HomePageState{}
class HomeScreenNotes extends HomePageState{
  final List<TaskModel> tasksNotArchive;
  HomeScreenNotes( {required this.tasksNotArchive});
}
class HomeScreenNotesNotFound extends HomePageState{}
