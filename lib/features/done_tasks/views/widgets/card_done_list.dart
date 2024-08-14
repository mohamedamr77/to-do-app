import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/fontfamily.dart';
import 'package:todo/core/imageCore.dart';

import '../../../../core/data/model/task_model.dart';
import '../../../done_details/views/screen.dart';

class CardDoneList extends StatelessWidget {
  const CardDoneList({super.key,

    required this.taskModel});


  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DoneDetailsScreen(
                      task: taskModel,
                    ),
              )),
      child: Card(
        color: Theme.of(context).cardColor,
        child: ListTile(
          leading: SvgPicture.asset(ImageApp.bagIcon),
          title: Text(taskModel.taskName!, style: Theme.of(context).textTheme.headlineLarge),
          subtitle: Text(
            taskModel.timeOfTask!,
            style: const TextStyle(
              color: ColorApp.primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontFamily: FontFamilyApp.lexendDecaRegular,
            ),
          ),
          trailing: const Column(
            children: [
              Text(
                "fdsa",
                style: TextStyle(
                  color: ColorApp.dateDoneScreenColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: FontFamilyApp.lexendDecaRegular,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "fsdafasd",
                style: TextStyle(
                  color: ColorApp.dateDoneScreenColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: FontFamilyApp.lexendDecaRegular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
