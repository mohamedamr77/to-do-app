import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/imageCore.dart';
import 'profile_picture.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key, required this.name, required this.pictureUser});
  final String name;
  final File pictureUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 12),
      color: ColorApp.appbarHomeScreenColor,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: SvgPicture.asset(ImageApp.menuImage),
          ),
          const SizedBox(width: 15),
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello!",
                  style: TextStyle(
                    color: ColorApp.textAppbarHomeScreenColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'LexendDeca',
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    color: ColorApp.textAppbarHomeScreenColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'LexendDeca',
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Saturday, May 25th",
                  style: TextStyle(
                    color: ColorApp.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'LexendDeca',
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          ProfilePicture(pictureUser: pictureUser),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
