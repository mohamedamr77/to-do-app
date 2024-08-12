import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/Image_name/get_cubit.dart';
import 'package:todo/cubit/Image_name/get_state.dart';
import 'package:todo/cubit/tasks/tasks_cubit.dart';
import 'package:todo/features/home_page/views/widgets/drawer_body.dart';
import 'package:todo/features/home_page/views/widgets/homepage_body.dart';
import '../../add_task/views/screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => TasksCubit(),
  child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () async {
          // Navigate to AddTaskScreen and wait for result
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
        },
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
      body: BlocBuilder<GetUserCubit, GetUserState>(
        builder: (BuildContext context, state) {
          return HomePageBody(
              name: BlocProvider.of<GetUserCubit>(context).name,
              pictureUser: BlocProvider.of<GetUserCubit>(context).image);
        },
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(60),
          ),
        ),
        child: DrawerBody(
            name: BlocProvider.of<GetUserCubit>(context).name,
            pictureUser: BlocProvider.of<GetUserCubit>(context).image),
      ),
    ),
);
  }
}
