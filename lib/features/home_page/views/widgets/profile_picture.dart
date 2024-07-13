import 'dart:io';
import 'package:flutter/material.dart';
import 'package:todo/core/colorCore.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key, required this.pictureUser});
  final File pictureUser;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundColor: ColorApp.whiteColor,
        ),
        CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(pictureUser),
        ),
      ],
    );
  }
}

