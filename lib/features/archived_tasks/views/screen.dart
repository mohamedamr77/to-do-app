import 'package:flutter/material.dart';
import 'package:todo/features/archived_tasks/views/widgets/arciheved_tasks_body.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffF9FEFB),
              Color(0xffFAFAFA),
            ],
          ),
        ),
        child: ArcihevedTasksBody(),
      ),
    );
  }
}
