import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/add_task/views/controller/cubit/add_task_cubit/add_task_cubit.dart';
import 'package:todo/features/add_task/views/controller/cubit/add_task_cubit/add_task_state.dart';
import 'package:todo/features/add_task/views/widgets/add_task_form.dart';
import 'package:todo/features/home_page/controller/home_page_Cubit.dart';

class AddTaskBody extends StatelessWidget {
  const AddTaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddTaskCubit(),
        child: SingleChildScrollView(
            child: BlocConsumer<AddTaskCubit, AddTaskState>(
          builder: (BuildContext context, AddTaskState state) {
            return AbsorbPointer(
                absorbing: state is AddTaskLoadingState ? true : false,
                child: const AddTaskForm());
          },
          listener: (BuildContext context, AddTaskState state) {
            if (state is AddTaskSuccessState) {
              BlocProvider.of<HomePageCubit>(context).fetchAllTasks();
              Navigator.pop(context);
            }
            if (state is AddTaskFailureState) {
              // Handle failure state
              if (kDebugMode) {
                print("Error : ${state.errorMessage}");
              }
            }
          },
        )));
  }
}
