import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/core/shared_widget/custom_appbar.dart';
import 'package:todo/core/textCore.dart';
import 'package:todo/features/archived_tasks/views/widgets/card_list.dart';
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
    List<TaskModel> archiveList = tasksList
        .where((archiveTask) => archiveTask.archivedTask == true)
        .toList();
    return archiveList.isEmpty
        ? SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  const CustomAppbar(title: TextApp.archivedTasksText),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.22,
                  ),
                  Text(
                    "Not Tasks Archieved\n Go to Tasks And Make Tasks Arciheve ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).canvasColor,
                      fontFamily: "jejuhallasan",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Lottie.asset("assets/images/lottie/arc3.json",
                        width: double.infinity, height: 250),
                  )
                ],
              ),
            ),
          )
        : SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Column(
                children: [
                  const CustomAppbar(title: TextApp.archivedTasksText),
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return CardList(
                          title: archiveList[index].taskName!,
                          subtitle: archiveList[index].timeOfTask,
                          taskModel: archiveList[index],
                          onTap: () {
                            tasksList[index].archivedTask = false;
                            setState(() {});
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
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
