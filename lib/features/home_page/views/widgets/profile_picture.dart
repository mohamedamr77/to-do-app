import 'dart:io';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key, required this.pictureUser});
  final File pictureUser;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
         CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).canvasColor==Colors.white? const Color(0xff335072) :Colors.white
        ),
        CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(pictureUser),
        ),
      ],
    );
  }
}

