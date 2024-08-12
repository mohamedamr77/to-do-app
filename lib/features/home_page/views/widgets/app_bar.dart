import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/fontfamily.dart';
import 'package:todo/core/imageCore.dart';
import '../../../../core/textCore.dart';
import '../../../../cubit/Image_name/get_cubit.dart';
import 'profile_picture.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection(
      {super.key,});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 12),
      color: Theme.of(context).indicatorColor,
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
                Text(TextApp.helloText,
                    style: Theme.of(context).textTheme.labelMedium),
                Text(BlocProvider.of<GetUserCubit>(context).name!, style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(height: 12),
                const Text(
                  "Saturday, May 25th",
                  style: TextStyle(
                    color: ColorApp.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: FontFamilyApp.lexendDecaSemiBold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          ProfilePicture(pictureUser: BlocProvider.of<GetUserCubit>(context).image!),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
