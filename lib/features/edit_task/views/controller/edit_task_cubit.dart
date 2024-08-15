import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/edit_task/views/controller/edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit() : super(EditTaskInitialState());

  void updateTitle(String title) {}
}