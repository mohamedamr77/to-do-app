abstract class AddTaskState {}

class AddTaskInitalState extends AddTaskState {}

class AddTaskLoadingState extends AddTaskState {}

class AddTaskSuccessState extends AddTaskState {}

class AddTaskFailureState extends AddTaskState {
  final String errorMessage;
  AddTaskFailureState(this.errorMessage);
}
