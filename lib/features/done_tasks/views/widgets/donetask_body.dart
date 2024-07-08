import 'package:flutter/material.dart';
import '../../../../core/data/model/task_list.dart';
import '../../../../core/data/model/task_model.dart';
import '../../../../core/shared_widget/custom_appbar.dart';
import 'card_done_list.dart';

class DoneTaskBody extends StatelessWidget {
  const DoneTaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<TaskModel> doneTasksList =tasksList.where((doneTasks) =>doneTasks.doneTask==true ).toList();
    return SafeArea(
      child: Padding(
        padding: const  EdgeInsets.symmetric(horizontal: 22, vertical:10),
        child: Column(
           children: [
             const CustomAppbar(title: "Done Tasks"),
             const SizedBox(height: 50,),
             Expanded(
               child: ListView.separated(
                   itemBuilder: (context, index) => CardDoneList(
                     taskModel: doneTasksList[index],
                     title: doneTasksList[index].taskName.text,
                     subtitle:doneTasksList[index].timeOfTask ,
                     startDate: doneTasksList[index].startDateSelectedDate,
                     endDate: doneTasksList[index].endDateSelectedDate,
                   ),
                   separatorBuilder: (context, index) => const SizedBox(height: 10,),
                   itemCount: doneTasksList.length,
               ),
             )
           ],
        ),
      ),
    );
  }
}
