import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/data/model/task_model.dart';
import 'package:todo/features/archived_tasks/controller/archived_task_cubit.dart';
import '../../../../core/shared_widget/custom_appbar.dart';
import '../../../../core/shared_widget/custom_button.dart';
import '../../../../core/textCore.dart';
import '../../../add_task/views/widgets/cutsom_field.dart';

class EditTaskBody extends StatefulWidget {
  const EditTaskBody({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  State<EditTaskBody> createState() => _EditTaskBodyState();
}

class _EditTaskBodyState extends State<EditTaskBody> {
  String? taskName, description;

  @override
  void initState() {
    super.initState();
    taskName = widget.taskModel.taskName;
    description = widget.taskModel.taskDescriptionController;

    // Ensure start and end dates are always initialized
    if (widget.taskModel.startDateSelectedDate == null) {
      widget.taskModel.startDateSelectedDate =
          DateTime.now().toIso8601String().split('T')[0];
    }
    if (widget.taskModel.endDateSelectedDate == null) {
      widget.taskModel.endDateSelectedDate =
          DateTime.now().toIso8601String().split('T')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const CustomAppbar(title: "Edit Task"),
              const SizedBox(height: 15),
              CustomField(
                initialValue: taskName,
                title: TextApp.taskNameText,
                hintText: TextApp.enterTheTaskNameText,
                minLine: 1,
                maxLine: 1,
                onChanged: (newValue) {
                  taskName = newValue;
                },
              ),
              const SizedBox(height: 10),
              CustomField(
                initialValue: description,
                title: TextApp.descriptionText,
                hintText: TextApp.enterTheTaskDescText,
                minLine: 4,
                maxLine: 4,
                onChanged: (newValue) {
                  description = newValue;
                },
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              CustomButton(
                isLoading: false,
                backGroundColor: Theme.of(context).canvasColor == Colors.black
                    ? const Color(0xff90B6E2)
                    : const Color(0xff3F6188),
                nameButton: "Done Edit",
                onTap: () {
                  widget.taskModel.taskName =
                      taskName ?? widget.taskModel.taskName;
                  widget.taskModel.taskDescriptionController =
                      description ?? widget.taskModel.taskDescriptionController;
                  widget.taskModel.save();
                  Navigator.of(context)
                    ..pop()
                    ..pop();
                  BlocProvider.of<ArchivedTaskCubit>(context).fetchAllTasks();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
