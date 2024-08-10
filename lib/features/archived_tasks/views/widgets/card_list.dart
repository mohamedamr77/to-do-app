import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/fontfamily.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/textCore.dart';
import '../../../../core/colorCore.dart';
import '../../../../core/data/model/task_model.dart';
import '../../../task_details_archieved/views/screen.dart';

class CardList extends StatelessWidget {
  const CardList(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.taskModel,
      required this.onTap});

  final String title;
  final TimeOfDay subtitle;
  final TaskModel taskModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TaskDetailsAchievedScreen(taskModel: taskModel),
            ));
      },
      child: Card(
        color: Theme.of(context).cardColor,
        child: ListTile(
          leading: SvgPicture.asset(ImageApp.bagIcon),
          title: Text(title, style: Theme.of(context).textTheme.titleMedium),
          subtitle: Text(
            _formatTaskTime(subtitle),
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

  String _formatTaskTime(TimeOfDay time) {
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour < 12 ? TextApp.amText : TextApp.pmText;
    return '$hour:$minute $period';
  }
}
