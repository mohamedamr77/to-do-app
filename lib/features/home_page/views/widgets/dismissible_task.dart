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
  const DismissibleTask(
      {super.key,
      required this.index,

      required this.taskModel});
  final int index;

  final TaskModel taskModel;

  @override
  State<DismissibleTask> createState() => _DismissibleTaskState();
}

class _DismissibleTaskState extends State<DismissibleTask> {
  @override
  Widget build(BuildContext context) {

    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (direction) => _confirmDismissTask(direction, context),
      background: _buildDismissBackground(),
      child: TaskCard(
        onTap: () {
          setState(() {
            tasksList[widget.index].doneTask =
                !tasksList[widget.index].doneTask;
          });
        },
        taskModel: widget.taskModel,
      ),
    );
  }

  Widget _buildDismissBackground() {
    return Card(
      color: ColorApp.bgDismissibleColor,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ListTile(
          leading: SvgPicture.asset(ImageApp.deleteIcon),
        ),
      ),
    );
  }

  Future<bool?> _confirmDismissTask(
      DismissDirection direction, BuildContext context) async {
    if (direction == DismissDirection.startToEnd) {
      return await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).canvasColor == Colors.white
                ? const Color(0xff283F5A)
                : Colors.white,
            title: Text(
              TextApp.cancelText,
              style: TextStyle(
                color: Theme.of(context).canvasColor == Colors.white
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            content: Text(
              TextApp.areYouSureDeleteText,
              style: TextStyle(
                color: Theme.of(context).canvasColor == Colors.white
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            actions: const [
              DialogButton(
                  text: TextApp.cancelText,
                  result: false,
                  color: ColorApp.primaryColor),
              DialogButton(
                  text: TextApp.deleteText,
                  result: true,
                  color: ColorApp.redColor),
            ],
          );
        },
      );
    }
    return false;
  }
}
