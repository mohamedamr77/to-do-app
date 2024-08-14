import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/features/home_page/controller/home_page_Cubit.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            BlocProvider.of<HomePageCubit>(context).fetchAllTasks();
          },
          child: SvgPicture.asset(
            "assets/images/svg/Arrow - Left.svg",
            height: 30,
            width: 30,
            color: Theme.of(context).canvasColor,
          ),
        ),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: "LexendDeca",
              fontSize: 19,
              color: Theme.of(context).canvasColor,
            ),
          ),
        ),
      ],
    );
  }
}
