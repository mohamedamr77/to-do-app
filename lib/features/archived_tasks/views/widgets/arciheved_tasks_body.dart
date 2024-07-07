import 'package:flutter/material.dart';
import 'package:todo/core/shared_widget/custom_appbar.dart';
import 'package:todo/features/archived_tasks/views/widgets/card_list.dart';
import 'package:todo/features/task_details_archieved/views/screen.dart';
import '../../../../core/data/model/task_list.dart';
import '../../../../core/data/model/task_model.dart';

class ArcihevedTasksBody extends StatefulWidget {
  const ArcihevedTasksBody({super.key});

  @override
  State<ArcihevedTasksBody> createState() => _ArcihevedTasksBodyState();
}

class _ArcihevedTasksBodyState extends State<ArcihevedTasksBody> {
  @override
  Widget build(BuildContext context) {
    List<TaskModel> archiveList =tasksList.where((archiveTask) =>archiveTask.archivedTask==true ).toList();
    return SafeArea(
      child: Padding(
        padding: const  EdgeInsets.symmetric(horizontal: 22, vertical:10),
        child: Column(
           children: [
             const CustomAppbar(title: "Archived Tasks"),
             SizedBox(height: 50,),
             Expanded(
               child: ListView.separated(
                 itemBuilder: (BuildContext context, int index) {
                   return CardList(
                     title: archiveList[index].taskName.text,
                     subtitle: archiveList[index].timeOfTask,
                     taskModel: archiveList[index],
                     onTap: () {
                       tasksList[index].archivedTask=false;
                       setState(() {
                       });
                     },
                   );
                   },
                 separatorBuilder: (BuildContext context, int index) {
                   return const SizedBox(height: 10,);
                 },
                 itemCount: archiveList.length,
               ),
             )
           ],
        ),
      ),
    );
  }
}
