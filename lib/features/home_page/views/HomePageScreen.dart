import 'dart:io';
import 'package:flutter/material.dart';
import 'package:todo/features/home_page/views/widgets/dialog_body.dart';
import 'package:todo/features/home_page/views/widgets/homepage_body.dart';
import '../../../core/colorCore.dart';
import '../../add_task/views/screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key, required this.name, required this.photo});
  static const id = "homePage Screen";
  final String name;
  final File photo;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:     FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: ColorApp.appbarHomeScreenColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        onPressed: ( ){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskScreen(),));
        },
        child: Icon(Icons.add,
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
        child: HomePageBody(name: name, pictureUser: photo),
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(60),
          ),
        ),
        child: DialogBody(name: name, photo: photo,),
      ),
    );
  }
}
