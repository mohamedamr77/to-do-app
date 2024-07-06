import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/get%20_name_and_picture_cubit/get_info_cubit.dart';
import 'package:todo/features/home_page/views/widgets/dialog_body.dart';
import 'package:todo/features/home_page/views/widgets/homepage_body.dart';
import '../../../core/colorCore.dart';
import '../../../cubit/get _name_and_picture_cubit/get_info_state.dart';
import '../../add_task/views/screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key});
  static const id = "homePage Screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetInfoCubit, InfoState>(
      builder: (context, state) {
        String name = '';
        File? photo; // Nullable File object

        if (state is NameEnterState) {
          name = state.name;
        }
        if (state is PictureEnterState) {
          photo = state.picture;
        }

        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            foregroundColor: Colors.white,
            backgroundColor: ColorApp.appbarHomeScreenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTaskScreen()),
              );
            },
            child: Icon(
              Icons.add,
              size: 35,
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffF9FEFB),
                  Color(0xffFAFAFA),
                ],
              ),
            ),
            child: HomePageBody(name: name, pictureUser: photo ?? File('')), // Pass a default File if photo is null
          ),
          drawer: Drawer(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(60),
              ),
            ),
            child: DialogBody(name: name, photo: photo?? File('')), // Handle nullable photo in DialogBody if needed
          ),
        );
      },
    );
  }
}
