import 'dart:io';
import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'task_list.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key, required this.name, required this.pictureUser});
  final String name;
  final File pictureUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarSection(name: name, pictureUser: pictureUser),
         Expanded(child: TaskList(name: name, photo: pictureUser,)),
      ],
    );
  }
}

