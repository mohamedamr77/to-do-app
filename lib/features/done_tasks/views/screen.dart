import 'package:flutter/material.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/features/done_tasks/views/widgets/donetask_body.dart';

class DoneTaskScreen extends StatelessWidget {
  const DoneTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorApp.bgGroundColor1,
              ColorApp.bgGroundColor2,
            ],
          ),
        ),
        child: const DoneTaskBody(

        ),
      ),
    );
  }
}
