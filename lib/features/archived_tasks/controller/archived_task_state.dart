import '../../../core/data/model/task_model.dart';

class ArchivedTaskState{}
class ArchivedTaskInitialState extends ArchivedTaskState{}
class ArchivedTaskNotesFoundState extends ArchivedTaskState{
  final List<TaskModel> tasksArchived;
  ArchivedTaskNotesFoundState( {required this.tasksArchived});
}
class DoneTaskNotesNotFoundState extends ArchivedTaskState{}
