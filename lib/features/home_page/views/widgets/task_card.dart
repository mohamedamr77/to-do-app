import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/data/model/task_list.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final task = tasksList[index];
    return Card(
      color: ColorApp.whiteColor,
      child: ListTile(
        leading: SvgPicture.asset(ImageApp.leadingItemDismissibleImage),
        title: Text(
          task.tasknameControllerRegester.text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'LexendDecaRegularStyle',
            color: Color(0xff24252C),
          ),
        ),
        subtitle: Text(
          _formatTaskTime(task.timeOfTask),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: 'LexendDecaRegularStyle',
            color: ColorApp.subtitleListTileHomeScreenColor,
          ),
        ),
        trailing: _buildDoneButton(),
      ),
    );
  }

  String _formatTaskTime(TimeOfDay time) {
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour < 12 ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  Widget _buildDoneButton() {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ColorApp.appbarHomeScreenColor,
        ),
        child: const Text(
          "Done",
          style: TextStyle(
            color: ColorApp.whiteColor,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontFamily: "LexendDecaRegularStyle",
          ),
        ),
      ),
    );
  }
}
