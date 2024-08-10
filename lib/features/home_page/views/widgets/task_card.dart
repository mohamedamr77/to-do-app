import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/fontfamily.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/features/task_details/views/screen.dart';
import '../../../../core/data/model/task_model.dart';
import '../../../../core/textCore.dart';

class TaskCard extends StatefulWidget {
  const TaskCard(
      {super.key,
      required this.onTap,
      required this.title,
      required this.subtitle,
      required this.taskModel});
  final String title;
  final TimeOfDay subtitle;
  final TaskModel taskModel;
  final void Function()? onTap;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TaskDetailsScreen(
                      task: widget.taskModel,
                    ))).then((x) {
          setState(() {});
        }),
        leading: SvgPicture.asset(ImageApp.bagIcon),
        title:
            Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(
          _formatTaskTime(widget.subtitle),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamilyApp.lexendDecaRegular,
            color: ColorApp.primaryColor,
          ),
        ),
        trailing: _buildDoneButton(),
      ),
    );
  }

  String _formatTaskTime(TimeOfDay time) {
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour < 12 ? TextApp.amText : TextApp.pmText;
    return '$hour:$minute $period';
  }

  Widget _buildDoneButton() {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: (Theme.of(context).canvasColor == Colors.black &&
                  widget.taskModel.doneTask == true
              ? ColorApp.primaryColor
              : Theme.of(context).canvasColor == Colors.black &&
                      widget.taskModel.doneTask == false
                  ? ColorApp.whiteColor
                  : Theme.of(context).canvasColor == Colors.white &&
                          widget.taskModel.doneTask == true
                      ? const Color(0xff90B6E2)
                      : const Color(0xff24364B)),
          border: widget.taskModel.doneTask == true
              ? null
              : Border.all(color: ColorApp.primaryColor),
        ),
        child: Text(
          TextApp.doneText,
          style: TextStyle(
            color:
                /*
                note :
                 Theme.of(context).canvasColor==Colors.black => Light Mode
                 Theme.of(context).canvasColor==Colors.white => black Mode
                 */
                (Theme.of(context).canvasColor == Colors.black &&
                        widget.taskModel.doneTask == true
                    ? Colors.white
                    : Theme.of(context).canvasColor == Colors.black &&
                            widget.taskModel.doneTask == false
                        ? const Color(0xff739CCB)
                        : Theme.of(context).canvasColor == Colors.white &&
                                widget.taskModel.doneTask == true
                            ? const Color(0xff24364B)
                            : const Color(0xffF0F0F0)),
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontFamily: FontFamilyApp.lexendDecaRegular,
          ),
        ),
      ),
    );
  }
}
