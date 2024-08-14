import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/shared_widget/show_deleteDialog.dart';
import '../../../../core/data/model/task_model.dart';
import '../../../../core/shared_function/convert_date.dart';
import '../../../../core/shared_widget/custom_appbar.dart';
import '../../../../core/shared_widget/custom_button.dart';
import '../../../../core/shared_widget/custom_container_show_data.dart';
import '../../../archived_tasks/controller/archived_task_cubit.dart';
import '../../controller/task_details_archieve_cubit.dart';

class TaskDetailsAchievedBody extends StatelessWidget {
  const TaskDetailsAchievedBody(
      {super.key, required this.taskAchieved, required this.index});
  final TaskModel taskAchieved;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        child: Column(
          children: [
            const CustomAppbar(title: "Task Details"),
            const SizedBox(height: 20),
            CustomContainerShowData(
              title: 'Task Name',
              detailsTitle: taskAchieved.taskName!,
            ),
            const SizedBox(height: 16),
            CustomContainerShowData(
                title: "Description",
                detailsTitle: taskAchieved.taskDescriptionController!),
            const SizedBox(height: 16),
            Card(
              color: Theme.of(context).cardColor,
              child: ListTile(
                leading: SvgPicture.asset("assets/images/svg/calendar.svg"),
                title: Text(
                  "Start Date",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: Text(
                  ConvertDate(date: taskAchieved.startDateSelectedDate!),
                  style: const TextStyle(
                    color: Color(0xffB6B4BD),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: "LexendDecaRegularStyle",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              color: Theme.of(context).cardColor,
              child: ListTile(
                leading: SvgPicture.asset("assets/images/svg/calendar.svg"),
                title: Text(
                  "End Date",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: Text(
                    ConvertDate(date: taskAchieved.endDateSelectedDate!),
                  style: const TextStyle(
                    color: Color(0xffB6B4BD),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: "LexendDecaRegularStyle",
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
                  "Add Time",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: const Text(
                  // _formatTaskTime(taskAchieved.timeOfTask),
                  "das",
                  style: TextStyle(
                    color: Color(0xffB6B4BD),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: "LexendDecaRegularStyle",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            CustomButton(
              backGroundColor: Theme.of(context).canvasColor == Colors.black
                  ? const Color(0xff90B6E2)
                  : const Color(0xff3F6188),
              nameButton: 'Unarchive',
              onTap: (){
                BlocProvider.of<TaskDetailsArchieveCubit>(context).updateArchive(index, taskAchieved);
                 Navigator.pop(context);
                 BlocProvider.of<ArchivedTaskCubit>(context).fetchAllTasks();
              },
              image: "assets/images/svg/archievetaskIcon.svg",
            ),
            const SizedBox(height: 8),
            CustomButton(
              backGroundColor: const Color(0XFFBD5461),
              nameButton: 'Delete',
              onTap: () {
                DeleteDialog.show(
                  task: taskAchieved,
                  onTap: () {
                    taskAchieved.delete();
                    Navigator.of(context)..pop()..pop();
                    BlocProvider.of<ArchivedTaskCubit>(context).fetchAllTasks();
                  },
                  context: context,
                );
              },
              image: "assets/images/svg/delete_dismissible.svg",
            ),
          ],
        ),
      ),
    );
  }


}

