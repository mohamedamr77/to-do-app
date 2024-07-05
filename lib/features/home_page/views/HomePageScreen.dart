import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todo/features/home_page/views/widgets/homepage_body.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key, required this.name, required this.photo});
  static const id="homePage Screen";
   final String name;
   final File photo;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: HomePageBody(name: name , pictureUser: photo,),
    );
  }
}
