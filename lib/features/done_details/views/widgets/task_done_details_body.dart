import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/fontfamily.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/textCore.dart';
import '../../../../core/data/model/task_model.dart';
import '../../../../core/shared_function/convert_date.dart';
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
                    ConvertDate(date: task.startDateSelectedDate!),
                    style: const TextStyle(
                      color:
                          ColorApp.subTitleListTileDateOrTimeOrTextFiledColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamilyApp.lexendDecaRegular,
                    ),
                  ),
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
                    ConvertDate(date: task.endDateSelectedDate!),
                    style: const TextStyle(
                      color:
                          ColorApp.subTitleListTileDateOrTimeOrTextFiledColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamilyApp.lexendDecaRegular,
                    ),
                  ),
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
                    "Time",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text(
                    // task.startTimeSelectedTime!,
                    task.timeOfTask!,
                    style: TextStyle(
                      color:
                          ColorApp.subTitleListTileDateOrTimeOrTextFiledColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamilyApp.lexendDecaRegular,
                    ),
                  ),
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

// String _formatTaskTime(String timeString) {
//   // Parse the timeString assuming it's in "HH:mm" format
//   final time = TimeOfDay(
//     hour: int.parse(timeString.split(":")[0]),
//     minute: int.parse(timeString.split(":")[1]),
//   );
//
//   final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
//   final minute = time.minute.toString().padLeft(2, '0');
//   final period = time.hour < 12 ? TextApp.amText : TextApp.pmText;
//
//   return '$hour:$minute $period';
// }
