import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/add_task/views/controller/cubit/add_task_cubit/add_task_cubit.dart';
import 'package:todo/features/add_task/views/controller/cubit/add_task_cubit/add_task_state.dart';
import 'package:todo/service/lcoal_notification/local_notification_service.dart';
import '../../../../core/data/model/task_model.dart';
import '../../../../core/shared_widget/custom_appbar.dart';
import '../../../../core/shared_widget/custom_button.dart';
import '../../../../core/textCore.dart';
import 'custom_data_picker.dart';
import 'custom_time_picker.dart';
import 'cutsom_field.dart';

class AddTaskForm extends StatelessWidget {
  const AddTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: SafeArea(
        child: Form(
          key: BlocProvider.of<AddTaskCubit>(context).formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(height: 10),
              const CustomAppbar(title: TextApp.addTaskText),
              const SizedBox(height: 15),
              CustomField(
                title: TextApp.taskNameText,
                hintText: TextApp.enterTheTaskNameText,
                minLine: 1,
                maxLine: 1,
                onSaved: (value) {
                  BlocProvider.of<AddTaskCubit>(context).taskName = value;
                },
                validator: (value) {
                  return BlocProvider.of<AddTaskCubit>(context).validate(value);
                },
              ),
              const SizedBox(height: 10),
              CustomField(
                title: TextApp.descriptionText,
                hintText: TextApp.enterTheTaskDescText,
                minLine: 4,
                maxLine: 4,
                onSaved: (value) {
                  BlocProvider.of<AddTaskCubit>(context)
                      .taskDescriptionController = value;
                },
                validator: (value) {
                  return BlocProvider.of<AddTaskCubit>(context).validate(value);
                },
              ),
              const SizedBox(height: 20),
              CustomDataPicker(
                title: TextApp.startText,
                subTitle: TextApp.enterTheStartDateText,
                selectedDate: BlocProvider.of<AddTaskCubit>(context)
                    .startDateSelectedDate,
                onDateSelected: (String picked) {
                  BlocProvider.of<AddTaskCubit>(context).startDateSelectedDate =
                      picked;
                },
              ),
              CustomDataPicker(
                title: TextApp.endDateText,
                subTitle: TextApp.enterTheEndDateText,
                selectedDate:
                    BlocProvider.of<AddTaskCubit>(context).endDateSelectedDate,
                onDateSelected: (String p) {
                  BlocProvider.of<AddTaskCubit>(context).endDateSelectedDate =
                      p;
                },
              ),
              CustomTimePicker(
                selectedTime:
                    BlocProvider.of<AddTaskCubit>(context).selectedTime,
                onTimeSelected: (String t) {
                  BlocProvider.of<AddTaskCubit>(context).selectedTime = t;
                },
                clickInButton: null,
              ),
              const SizedBox(height: 20),
              BlocBuilder<AddTaskCubit, AddTaskState>(
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state is AddTaskLoadingState ? true : false,
                    backGroundColor:
                        Theme.of(context).canvasColor == Colors.black
                            ? const Color(0xff90B6E2)
                            : const Color(0xff3F6188),
                    nameButton: TextApp.addTaskText,
                    onTap: () => onTapButton(context),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

onTapButton(BuildContext context) {
  BlocProvider.of<AddTaskCubit>(context).startDateSelectedDate ??=
      DateTime.now().toString();
  BlocProvider.of<AddTaskCubit>(context).endDateSelectedDate ??=
      DateTime.now().toString();
  BlocProvider.of<AddTaskCubit>(context).selectedTime ??=
      '${TimeOfDay.now().hour}:${TimeOfDay.now().minute} ${TimeOfDay.now().period.name.toUpperCase()}';

  if (BlocProvider.of<AddTaskCubit>(context).formKey.currentState!.validate()) {
    BlocProvider.of<AddTaskCubit>(context).formKey.currentState!.save();

    var task = TaskModel(
      taskName: BlocProvider.of<AddTaskCubit>(context).taskName,
      taskDescriptionController:
          BlocProvider.of<AddTaskCubit>(context).taskDescriptionController,
      startDateSelectedDate:
          BlocProvider.of<AddTaskCubit>(context).startDateSelectedDate,
      endDateSelectedDate:
          BlocProvider.of<AddTaskCubit>(context).endDateSelectedDate,
      timeOfTask: BlocProvider.of<AddTaskCubit>(context).selectedTime,
      id: DateTime.now().millisecondsSinceEpoch,
    );
    BlocProvider.of<AddTaskCubit>(context).addTask(task);
    LocalNotificationService.showBasicNotification();
  }
}
