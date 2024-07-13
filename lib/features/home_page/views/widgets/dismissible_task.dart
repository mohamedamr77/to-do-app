import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/data/model/task_list.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/textCore.dart';
import '../../../../core/data/model/task_model.dart';
import 'dialog_buttons.dart';
import 'task_card.dart';

class DismissibleTask extends StatefulWidget {
  const DismissibleTask({super.key, required this.index, required this.title, required this.subtitle, required this.taskModel});
  final int index;
  final String title;
  final TimeOfDay subtitle;
  final TaskModel taskModel;

  @override
  State<DismissibleTask> createState() => _DismissibleTaskState();
}

class _DismissibleTaskState extends State<DismissibleTask> {
  @override
  Widget build(BuildContext context) {
    List<TaskModel> notArchiveList =tasksList.where((notArchiveTask) =>notArchiveTask.archivedTask==false ).toList();
    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (direction) => _confirmDismissTask(direction, context),
      background: _buildDismissBackground(),
      child: TaskCard(
        onTap: () {
          setState(() {
            tasksList[widget.index].doneTask=!tasksList[widget.index].doneTask;
          });
        },
        title: widget.title,
        subtitle: widget.subtitle,
        taskModel: widget.taskModel,
      ),
    );
  }

  Widget _buildDismissBackground() {
    return Card(
      color:  ColorApp.bgDismissibleColor,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ListTile(
          leading: SvgPicture.asset(ImageApp.deleteIcon),
        ),
      ),
    );
  }

  Future<bool?> _confirmDismissTask(DismissDirection direction, BuildContext context) async {
    if (direction == DismissDirection.startToEnd) {
      return await showDialog<bool>(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text(TextApp.cancelText),
            content: Text(TextApp.areYouSureDeleteText),
            actions: [
              DialogButton(text: TextApp.cancelText, result: false, color: ColorApp.primaryColor),
              DialogButton(text: TextApp.deleteText, result: true, color: ColorApp.redColor),
            ],
          );
        },
      );
    }
     return false;
  }
}
