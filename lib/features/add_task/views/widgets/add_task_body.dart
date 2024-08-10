import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/data/model/task_list.dart';
import 'package:todo/core/data/model/task_model.dart';
import 'package:todo/core/shared_widget/custom_appbar.dart';
import 'package:todo/features/add_task/views/widgets/add_task_form.dart';
import 'package:todo/features/home_page/views/HomePageScreen.dart';
import '../../../../core/shared_widget/custom_button.dart';
import '../../../../core/textCore.dart';
import 'custom_data_picker.dart';
import 'custom_time_picker.dart';
import 'cutsom_field.dart';

class AddTaskBody extends StatelessWidget {
  const AddTaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AddTaskForm(),
    );
  }
}
