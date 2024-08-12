import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/tasks/tasks_cubit.dart';
import 'app_bar.dart';
import 'task_list.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody(
      {super.key, required this.name, required this.pictureUser});
  final String? name;
  final File? pictureUser;

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {

  //  @override
  // void initState() {
  //   // TODO: implement initState
  //    BlocProvider.of<TasksCubit>(context).fetchAllTasks();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarSection(name: widget.name, pictureUser: widget.pictureUser),
        const Expanded(child: TaskList()),
      ],
    );
  }
}
