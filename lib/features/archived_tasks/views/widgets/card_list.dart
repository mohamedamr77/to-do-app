import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/fontfamily.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/textCore.dart';
import '../../../../core/colorCore.dart';
import '../../../../core/data/model/task_model.dart';
import '../../../task_details_archieved/views/screen.dart';

class CardList extends StatelessWidget {
  const CardList({super.key, required this.title, required this.subtitle, required this.taskModel,required this.onTap});
   final String title;
   final TimeOfDay subtitle;
   final TaskModel taskModel;
   final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  TaskDetailsAchievedScreen(taskModel: taskModel),));
      },
      child: Card(
        color: ColorApp.whiteColor,
        child: ListTile(
          leading: SvgPicture.asset(ImageApp.bagIcon),
          title: Text(title,
            style: const TextStyle(
              color: Color(0xff24252C),
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: FontFamilyApp.lexendDecaRegular,
            ),
          ),
          subtitle: Text(_formatTaskTime(subtitle),
            style: const TextStyle(
              color: ColorApp.primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontFamily: FontFamilyApp.lexendDecaRegular,
            ),
          ),
          trailing: _buildButton(),
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

  Widget _buildButton() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ColorApp.primaryColor,
        ),
        child: const Text(
          TextApp.unarchiveText,
          style: TextStyle(
            color: ColorApp.whiteColor,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            fontFamily: FontFamilyApp.lexendDecaRegular,
          ),
        ),
      ),
    );
  }
}
