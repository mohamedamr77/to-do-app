import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/done_tasks/views/controller/done_task_cubit.dart';
import 'package:todo/features/done_tasks/views/widgets/donetask_body.dart';

class DoneTaskScreen extends StatelessWidget {
  const DoneTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoneTaskCubit(),
      child: const Scaffold(
        body: DoneTaskBody(),
      ),
    );
  }
}

/*
Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorApp.bgGroundColor1,
              ColorApp.bgGroundColor2,
            ],
          ),
        ),
        child: const DoneTaskBody(

        ),
      ),
 */
