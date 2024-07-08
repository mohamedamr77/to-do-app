import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/data/model/task_model.dart';
import '../../../done_details/views/screen.dart';

class CardDoneList extends StatelessWidget {
   const CardDoneList({super.key, required this.title, required this.subtitle, required this.startDate, required this.endDate, required this.taskModel});
     final String title;
     final TimeOfDay subtitle;
     final DateTime startDate;
     final DateTime endDate;
     final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>Navigator.push(context,MaterialPageRoute(builder: (context) => DoneDetailsScreen(
        task: taskModel,),)),
      child: Card(
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
          trailing: Column(
            children: [
              Text(
                DateFormat('dd MMM, y').format(startDate),
                style: TextStyle(
                  color: Color(0xff919295),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: "LexendDecaRegularStyle",
                ),
              ),
              SizedBox(height: 10,),
              Text(
                DateFormat('dd MMM, y').format(endDate),
                style: TextStyle(
                  color: Color(0xff919295),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: "LexendDecaRegularStyle",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
   String _formatTaskTime(TimeOfDay time) {
     final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
     final minute = time.minute.toString().padLeft(2, '0');
     final period = time.hour < 12 ? 'AM' : 'PM';
     return '$hour:$minute $period';
   }
}
