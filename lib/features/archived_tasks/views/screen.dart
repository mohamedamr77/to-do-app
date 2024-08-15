import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/archived_tasks/views/widgets/arciheved_tasks_body.dart';
import 'package:todo/features/home_page/controller/home_page_Cubit.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<HomePageCubit>(context).fetchAllTasks();
        return true;
      },
      child: const Scaffold(
        body: ArcihevedTasksBody(),
      ),
    );
  }
}
