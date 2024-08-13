import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../colorCore.dart';
import '../data/model/task_model.dart';
import '../fontfamily.dart';
import '../textCore.dart';
import '../../features/home_page/controller/home_page_Cubit.dart';
import '../../features/home_page/views/HomePageScreen.dart';

class DeleteDialog extends StatelessWidget {
  final TaskModel task;
  const DeleteDialog({super.key, required this.task,required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
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
          fontSize: 16,
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTap,
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
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
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
        ),
      ],
    );
  }

  static void show({required BuildContext context,required TaskModel task,required void Function()? onTap}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeleteDialog(task: task, onTap: onTap,);
      },
    );
  }
}
