import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/core/data/model/task_model.dart';
import 'package:todo/core/fontfamily.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/shared_function/convert_date.dart';
import 'package:todo/core/shared_widget/custom_appbar.dart';
import 'package:todo/core/textCore.dart';
import 'package:todo/features/home_page/views/HomePageScreen.dart';
import 'package:todo/features/task_details/views/controller/task_details_cubit.dart';
import 'package:todo/core/shared_widget/show_deleteDialog.dart';
import '../../../../core/shared_widget/custom_button.dart';
import '../../../../core/shared_widget/custom_container_show_data.dart';
import '../../../edit_task/views/edit_task_view.dart';
import '../../../home_page/controller/home_page_Cubit.dart';

class TaskDetailsBody extends StatelessWidget {
  const TaskDetailsBody({super.key, required this.task, required this.index});
  final TaskModel task;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            children: [
              const CustomAppbar(title: TextApp.taskDetailsText),
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
                  title: Text(TextApp.startDateText,
                      style: Theme.of(context).textTheme.bodySmall),
                  subtitle: Text(
                    ConvertDate(date: task.startDateSelectedDate!),
                    style: const TextStyle(
                      color: Color(0xffB6B4BD),
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
                  title: Text(TextApp.endDateText,
                      style: Theme.of(context).textTheme.bodySmall),
                  subtitle: Text(
                    ConvertDate(date: task.endDateSelectedDate!),
                    style: const TextStyle(
                      color: Color(0xffB6B4BD),
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
                  title: Text(TextApp.addTimeText,
                      style: Theme.of(context).textTheme.bodySmall),
                  subtitle: Text(
                    task.timeOfTask!,
                    style: const TextStyle(
                      color: Color(0xffB6B4BD),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamilyApp.lexendDecaRegular,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              CustomButton(
                backGroundColor: Theme.of(context).canvasColor == Colors.black
                    ? const Color(0xff90B6E2)
                    : const Color(0xff3F6188),
                nameButton: task.archivedTask == true ? "Unarchive" : "Archive",
                onTap: () {
                  BlocProvider.of<TaskDetailsCubit>(context)
                      .updateArchive(task);
                  Navigator.pop(context);
                  BlocProvider.of<HomePageCubit>(context).fetchAllTasks();
                },
                image: ImageApp.archieveIcon,
              ),
              const SizedBox(height: 8),
              CustomButton(
                backGroundColor: Theme.of(context).canvasColor == Colors.black
                    ? const Color(0xff90B6E2)
                    : const Color(0xff3F6188),
                nameButton: "Edit ",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditTaskScreen(
                          taskModel: task,
                        ),
                      ));
                },
                widget: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: FaIcon(
                    FontAwesomeIcons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              CustomButton(
                backGroundColor: const Color(0XFFBD5461),
                nameButton: TextApp.deleteText,
                onTap: () {
                  DeleteDialog.show(
                    context: context,
                    task: task,
                    onTap: () {
                      task.delete();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePageScreen(),
                        ),
                      );
                      BlocProvider.of<HomePageCubit>(context).fetchAllTasks();
                    },
                  );
                },
                image: ImageApp.deleteIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
