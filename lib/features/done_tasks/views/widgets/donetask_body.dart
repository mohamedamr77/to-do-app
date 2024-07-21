import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/core/textCore.dart';
import '../../../../core/data/model/task_list.dart';
import '../../../../core/data/model/task_model.dart';
import '../../../../core/shared_widget/custom_appbar.dart';
import 'card_done_list.dart';

class DoneTaskBody extends StatelessWidget {
  const DoneTaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<TaskModel> doneTasksList =tasksList.where((doneTasks) =>doneTasks.doneTask==true ).toList();
    return doneTasksList.isEmpty?
        SafeArea(
      child: Padding(
        padding: const  EdgeInsets.symmetric(horizontal: 15, vertical:10),
        child: Column(
          children: [
            const CustomAppbar(title: TextApp.archivedTasksText),
            SizedBox(height: MediaQuery.of(context).size.height*0.22,),
             Text("Not Tasks Done \n Make Task And Go to Task And Make Task Done ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color:  Theme.of(context).canvasColor,
                fontFamily: "jejuhallasan",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Lottie.asset("assets/images/lottie/arc3.json",
                  width: double.infinity,
                  height: 250
              ),
            )
          ],
        ),
      ),
    )
        :
        SafeArea(
      child: Padding(
        padding: const  EdgeInsets.symmetric(horizontal: 22, vertical:10),
        child: Column(
          children: [
            const CustomAppbar(title: TextApp.doneTasksText),
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
