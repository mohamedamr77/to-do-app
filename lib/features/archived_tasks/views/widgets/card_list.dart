import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/data/model/task_list.dart';
import '../../../../core/colorCore.dart';
import '../../../../core/data/model/task_model.dart';

class CardList extends StatelessWidget {
  const CardList({super.key, required this.title, required this.subtitle,required this.onTap});
   final String title;
   final TimeOfDay subtitle;
   final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: SvgPicture.asset("assets/images/svg/leadingItemDismissible.svg"),
        title: Text(title,
          style: TextStyle(
            color: Color(0xff24252C),
            fontWeight: FontWeight.w600,
            fontSize: 14,
            fontFamily: "LexendDecaRegularStyle",
          ),
        ),
        subtitle: Text(_formatTaskTime(subtitle),
          style: TextStyle(
            color: Color(0xff90B6E2),
            fontWeight: FontWeight.w400,
            fontSize: 12,
            fontFamily: "LexendDecaRegularStyle",
          ),
        ),
        trailing: _buildButton(),
      ),
    );
  }
  String _formatTaskTime(TimeOfDay time) {
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour < 12 ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  Widget _buildButton() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ColorApp.appbarHomeScreenColor,
        ),
        child: const Text(
          "Unarchive",
          style: TextStyle(
            color: ColorApp.whiteColor,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            fontFamily: "LexendDecaRegularStyle",
          ),
        ),
      ),
    );
  }
}
