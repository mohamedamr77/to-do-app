import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/archived_tasks/views/widgets/arciheved_tasks_body.dart';

import '../controller/archived_task_cubit.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArchivedTaskCubit(),
      child: Scaffold(
        body: ArcihevedTasksBody(),
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
        child: const ArcihevedTasksBody(),
      ),
 */
