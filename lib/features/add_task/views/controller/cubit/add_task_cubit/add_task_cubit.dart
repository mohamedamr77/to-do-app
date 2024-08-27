import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/core/box.dart';
import 'package:todo/core/data/model/task_model.dart';
import 'package:todo/features/add_task/views/controller/cubit/add_task_cubit/add_task_state.dart';

import '../../../../../../core/textCore.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitalState());
  String? taskName;
  String? taskDescriptionController;

  String? startDateSelectedDate;
  String? endDateSelectedDate;
  String? selectedTime;

  final formKey = GlobalKey<FormState>();

  addTask(TaskModel task) async {
    emit(AddTaskLoadingState());
    try {
      var tasksBox = Hive.box<TaskModel>(BoxApp.kTaskBox);
      await tasksBox.add(task);
      emit(AddTaskSuccessState());
    } catch (e) {
      emit(AddTaskFailureState(e.toString()));
    }
  }

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return TextApp.pleaseEnterTheTaskNameText;
    }
    return null;
  }
}
