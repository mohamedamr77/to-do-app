import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/fontfamily.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/textCore.dart';
import '../../../../core/data/model/task_model.dart';
import '../../../../core/shared_widget/custom_appbar.dart';
import '../../../../core/shared_widget/custom_container_show_data.dart';

class TaskDoneDetailsBody extends StatelessWidget {
  const TaskDoneDetailsBody({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const CustomAppbar(title: TextApp.taskNameText),
              const SizedBox(height: 20),
              CustomContainerShowData(
                title: TextApp.taskNameText,
                detailsTitle: task.taskName!,
              ),
              const SizedBox(height: 16),
              CustomContainerShowData(
                  title: TextApp.descriptionText,
                  detailsTitle: task.taskDescriptionController!),
              const SizedBox(height: 16),
              Card(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  leading: SvgPicture.asset(ImageApp.calendarImage),
                  title: Text(
                    TextApp.startDateText,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text(
                    DateFormat('dd MMM, y').format(task.startDateSelectedDate),
                    style: const TextStyle(
                      color:
                          ColorApp.subTitleListTileDateOrTimeOrTextFiledColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamilyApp.lexendDecaRegular,
                    ),
                  ),
                  // trailing: SvgPicture.asset("assets/images/svg/Arrow - Down .svg"),
                ),
              ),
              const SizedBox(height: 8),
              Card(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  leading: SvgPicture.asset(ImageApp.calendarImage),
                  title: Text(
                    TextApp.endDateText,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text(
                    DateFormat('dd MMM, y').format(task.startDateSelectedDate),
                    style: const TextStyle(
                      color:
                          ColorApp.subTitleListTileDateOrTimeOrTextFiledColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamilyApp.lexendDecaRegular,
                    ),
                  ),
                  //trailing: SvgPicture.asset(ImageApp.arrowDownImage),
                ),
              ),
              const SizedBox(height: 8),
              Card(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  leading: Theme.of(context).canvasColor == Colors.black
                      ? SvgPicture.asset("assets/images/svg/timeicon.svg")
                      : SvgPicture.asset(
                          "assets/images/svg/fluent-emoji-flat_watch_blackmode.svg"),
                  title: Text(
                    TextApp.addTimeText,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text(
                    _formatTaskTime(task.timeOfTask),
                    style: const TextStyle(
                      color:
                          ColorApp.subTitleListTileDateOrTimeOrTextFiledColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamilyApp.lexendDecaRegular,
                    ),
                  ),
                  //trailing: SvgPicture.asset(ImageApp.arrowDownImage),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

String _formatTaskTime(TimeOfDay time) {
  final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
  final minute = time.minute.toString().padLeft(2, '0');
  final period = time.hour < 12 ? TextApp.amText : TextApp.pmText;
  return '$hour:$minute $period';
}
