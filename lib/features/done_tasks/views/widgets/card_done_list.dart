import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/fontfamily.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/textCore.dart';

import '../../../../core/data/model/task_model.dart';
import '../../../done_details/views/screen.dart';

class CardDoneList extends StatelessWidget {
  const CardDoneList({super.key,
    required this.title,
    required this.subtitle,
    required this.startDate,
    required this.endDate,
    required this.taskModel});

  final String title;
  final String subtitle;
  final String startDate;
  final String endDate;
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
        color: Theme
            .of(context)
            .cardColor,
        child: ListTile(
          leading: SvgPicture.asset(ImageApp.bagIcon),
          title: Text(title, style: Theme
              .of(context)
              .textTheme
              .headlineLarge),
          subtitle: Text(
            "dsfa",
            style: const TextStyle(
              color: ColorApp.primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontFamily: FontFamilyApp.lexendDecaRegular,
            ),
          ),
          trailing: Column(
            children: [
              Text(
                "fdsa",
                style: const TextStyle(
                  color: ColorApp.dateDoneScreenColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: FontFamilyApp.lexendDecaRegular,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "fsdafasd",
                style: const TextStyle(
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
