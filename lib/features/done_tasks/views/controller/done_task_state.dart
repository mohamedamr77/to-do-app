import 'package:todo/core/data/model/task_model.dart';

class DoneTaskState {}

class DoneTaskInitialState extends DoneTaskState {}

class DoneTaskNotesFoundState extends DoneTaskState {
  final List<TaskModel> tasksDone;
  DoneTaskNotesFoundState({required this.tasksDone});
}

class DoneTaskNotesNotFoundState extends DoneTaskState {}
