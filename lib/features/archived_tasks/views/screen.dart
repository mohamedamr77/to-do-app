import 'package:flutter/material.dart';
import 'package:todo/features/archived_tasks/views/widgets/arciheved_tasks_body.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ArcihevedTasksBody(),
    );
  }
}
/*
 Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorApp.bgGroundColor1,
              ColorApp.bgGroundColor2,
            ],
          ),
        ),
        child: const ArcihevedTasksBody(),
      ),
 */
