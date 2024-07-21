import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/fontfamily.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/textCore.dart';

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
        color: Theme.of(context).cardColor,
        child: ListTile(
          leading: SvgPicture.asset(ImageApp.bagIcon),
          title: Text(title,
            style:  Theme.of(context).textTheme.headlineLarge
          ),
          subtitle: Text(_formatTaskTime(subtitle),
            style: const TextStyle(
              color: ColorApp.primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontFamily: FontFamilyApp.lexendDecaRegular,
            ),
          ),
          trailing: Column(
            children: [
              Text(
                DateFormat('dd MMM, y').format(startDate),
                style:  const TextStyle(
                  color: ColorApp.dateDoneScreenColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily:FontFamilyApp.lexendDecaRegular,
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                DateFormat('dd MMM, y').format(endDate),
                style: const TextStyle(
                  color: ColorApp.dateDoneScreenColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: FontFamilyApp.lexendDecaRegular,
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
     final period = time.hour < 12 ? TextApp.amText : TextApp.pmText;
     return '$hour:$minute $period';
   }
}
