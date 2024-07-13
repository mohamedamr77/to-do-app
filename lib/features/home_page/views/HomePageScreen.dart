import 'dart:io';
import 'package:flutter/material.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/features/home_page/views/widgets/drawer_body.dart';
import 'package:todo/features/home_page/views/widgets/homepage_body.dart';
import '../../add_task/views/screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key, required this.name, required this.photo});

  final String name;
  final File photo;

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: ColorApp.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () async {
          // Navigate to AddTaskScreen and wait for result
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  AddTaskScreen(name: widget.name, photo: widget.photo,)),
          );

          // Check if a task was added
          if (result == true) {
            // Update UI or fetch data if needed
            setState(() {
              // Example: Refresh data
              // fetchData();
            });
          }
        },
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorApp.bgGroundColor1,
              ColorApp.bgGroundColor2,
            ],
          ),
        ),
        child: HomePageBody(name: widget.name, pictureUser: widget.photo),
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(60),
          ),
        ),
        child: DrawerBody(name: widget.name, pictureUser: widget.photo),
      ),
    );
  }
}
