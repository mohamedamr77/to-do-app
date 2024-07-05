import 'package:flutter/material.dart';
import 'package:todo/features/home_page/views/widgets/homepage_body.dart';

class HomePageScreen extends StatelessWidget {
   HomePageScreen({super.key,  this.name,  this.pictureUser});
  static const id="homePage Screen";
   String? name;
   String? pictureUser;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          body: HomePageBody(name: '', pictureUser: '',),
    );
  }
}
