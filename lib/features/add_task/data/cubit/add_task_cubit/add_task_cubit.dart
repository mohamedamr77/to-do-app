import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/add_task/data/cubit/add_task_cubit/add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState>{
  AddTaskCubit ():super(AddTaskInitalState());}