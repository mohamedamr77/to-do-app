

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colorCore.dart';
import '../../../../core/data/model/task_model.dart';
import '../../../../core/fontfamily.dart';
import '../../../../core/textCore.dart';
import '../../../home_page/controller/home_page_Cubit.dart';
import '../../../home_page/views/HomePageScreen.dart';

void showDeleteDialog(BuildContext context, TaskModel task) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).canvasColor == Colors.white
            ? const Color(0xff283F5A)
            : Colors.white,
        content: Text(
          TextApp.areYouSureDeleteText,
          style: TextStyle(
              color: Theme.of(context).canvasColor == Colors.white
                  ? const Color(0xffF0F0F0)
                  : Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: FontFamilyApp.lexendDecaRegular,
              fontSize: 16),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  task.delete();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePageScreen(),));
                  BlocProvider.of<HomePageCubit>(context).fetchAllTasks();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color(0xffBD5461),
                  ),
                  child: const Text(
                    TextApp.yesText,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "LexendDeca",
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: ColorApp.primaryColor,
                  ),
                  child: const Text(
                    TextApp.noText,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: FontFamilyApp.lexendDecaSemiBold,
                      color: ColorApp.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}