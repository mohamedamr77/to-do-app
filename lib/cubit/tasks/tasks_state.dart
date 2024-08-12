class TasksState {}
class TasksInitalState extends TasksState{}
class TasksSuccessState extends TasksState{}
class TasksFailureState extends TasksState{
  final String errorMessage;
  TasksFailureState(this.errorMessage);
}