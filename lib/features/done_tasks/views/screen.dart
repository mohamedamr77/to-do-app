import 'package:flutter/material.dart';
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
              Color(0xffF9FEFB),
              Color(0xffFAFAFA),
            ],
          ),
        ),
        child: DoneTaskBody(

        ),
      ),
    );
  }
}
