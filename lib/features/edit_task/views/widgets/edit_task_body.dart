import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/data/model/task_model.dart';
import 'package:todo/features/home_page/controller/home_page_Cubit.dart';
import '../../../../core/shared_widget/custom_appbar.dart';
import '../../../../core/shared_widget/custom_button.dart';
import '../../../../core/textCore.dart';
import '../../../add_task/views/widgets/custom_data_picker.dart';
import '../../../add_task/views/widgets/custom_time_picker.dart';
import '../../../add_task/views/widgets/cutsom_field.dart';

class EditTaskBody extends StatefulWidget {
  const EditTaskBody({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  State<EditTaskBody> createState() => _EditTaskBodyState();
}
class _EditTaskBodyState extends State<EditTaskBody> {

  String? taskName,description;

  void initState(){
    super.initState();
    taskName = widget.taskModel.taskName;
    description = widget.taskModel.taskDescriptionController;

}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: SafeArea(
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
              onChanged: (newValue){
                taskName=newValue;
              },
            ),

            const SizedBox(height: 10),

            CustomField(
              initialValue: description,
              title: TextApp.descriptionText,
              hintText: TextApp.enterTheTaskDescText,
              minLine: 4,
              maxLine: 4,
              onChanged: (newValue){
                description=newValue;
              },

            ),
            const SizedBox(height: 20),

            CustomDataPicker(
              title: TextApp.startText,
              subTitle: TextApp.enterTheStartDateText,
               selectedDate: "22021",
              onDateSelected: (String picked) {
                // BlocProvider.of<AddTaskCubit>(context).startDateSelectedDate = picked;
              },
            ),

            CustomDataPicker(
              title: TextApp.endDateText,
              subTitle: TextApp.enterTheEndDateText,
              selectedDate: "21312",
              onDateSelected: (String p) {
                // BlocProvider.of<AddTaskCubit>(context).endDateSelectedDate = p;
              },
            ),

            CustomTimePicker(
              selectedTime: "2131",
              onTimeSelected: (String t) {
                // BlocProvider.of<AddTaskCubit>(context).selectedTime = t;
              },
              clickInButton: null,
            ),
            const SizedBox(height: 20),

         CustomButton(
        isLoading: false ,
        backGroundColor: Theme.of(context).canvasColor == Colors.black
        ? const Color(0xff90B6E2)
            : const Color(0xff3F6188),
        nameButton: "Done Edit",
           onTap: (){
            widget.taskModel.taskName=taskName??widget.taskModel.taskName;
            widget.taskModel.taskDescriptionController=description??widget.taskModel.taskDescriptionController;
            widget.taskModel.save();
            BlocProvider.of<HomePageCubit>(context).fetchAllTasks();
             Navigator.pop(context);
           },
        )
          ],
        ),
      ),
    );
  }
}
