import 'package:todo/core/data/model/task_model.dart';

class HomePageState{}
class HomePageInitialState extends HomePageState{}
class HomeScreenNotesIsFound extends HomePageState{
  final List<TaskModel> tasksNotArchive;
  HomeScreenNotesIsFound( {required this.tasksNotArchive});
}
class HomeScreenNotesNotFound extends HomePageState{}
