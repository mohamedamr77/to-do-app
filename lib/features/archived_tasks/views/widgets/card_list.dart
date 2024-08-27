import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/fontfamily.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/textCore.dart';
import '../../../../core/colorCore.dart';
import '../../../../core/data/model/task_model.dart';
import '../../../task_details_archieved/views/screen.dart';

class CardList extends StatelessWidget {
  const CardList({
    super.key,
    required this.taskModel,
    required this.index,
    required this.onTap,
  });

  final TaskModel taskModel;
  final int index;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskDetailsAchievedScreen(
                taskModel: taskModel,
                index: index,
              ),
            ));
      },
      child: Card(
        color: Theme.of(context).cardColor,
        child: ListTile(
          leading: SvgPicture.asset(ImageApp.bagIcon),
          title: Text(taskModel.taskName!,
              style: Theme.of(context).textTheme.titleMedium),
          subtitle: Text(
            taskModel.timeOfTask!,
            style: const TextStyle(
              color: ColorApp.primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontFamily: FontFamilyApp.lexendDecaRegular,
            ),
          ),
          trailing: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: (Theme.of(context).canvasColor == Colors.black &&
                        taskModel.archivedTask == true
                    ? ColorApp.primaryColor
                    : Theme.of(context).canvasColor == Colors.black &&
                            taskModel.archivedTask == false
                        ? ColorApp.whiteColor
                        : Theme.of(context).canvasColor == Colors.white &&
                                taskModel.archivedTask == true
                            ? const Color(0xff90B6E2)
                            : const Color(0xff24364B)),
              ),
              child: Text(
                TextApp.unarchiveText,
                style: TextStyle(
                  color: (Theme.of(context).canvasColor == Colors.white &&
                          taskModel.archivedTask == true
                      ? const Color(0xff24364B)
                      : Colors.white),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  fontFamily: FontFamilyApp.lexendDecaRegular,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
