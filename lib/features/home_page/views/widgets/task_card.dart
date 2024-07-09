import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/features/task_details/views/screen.dart';
import '../../../../core/data/model/task_model.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key,required this.onTap, required this.title, required this.subtitle, required this.taskModel, required this.name, required this.photo});
  final String title;
  final TimeOfDay subtitle;
  final TaskModel taskModel;
  final void Function()? onTap;
  final String name;
  final File photo;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorApp.whiteColor,
      child: ListTile(
        onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => TaskDetailsScreen(
          task: widget.taskModel,
          name:widget.name,
          photo: widget.photo,),)).then((x){
        setState(() {

        });
        }),
        leading: SvgPicture.asset(ImageApp.leadingItemDismissibleImage),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'LexendDecaRegularStyle',
            color: Color(0xff24252C),
          ),
        ),
        subtitle: Text(
          _formatTaskTime(widget.subtitle),
          style: const TextStyle(
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
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: widget.taskModel.doneTask==true? ColorApp.appbarHomeScreenColor :ColorApp.whiteColor,
           border:widget.taskModel.doneTask==true?  null: Border.all(color:ColorApp.appbarHomeScreenColor ),
        ),
        child:  Text(
          "Done",
          style: TextStyle(
            color:widget.taskModel.doneTask==true? ColorApp.whiteColor :ColorApp.appbarHomeScreenColor ,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontFamily: "LexendDecaRegularStyle",
          ),
        ),
      ),
    );
  }
}
