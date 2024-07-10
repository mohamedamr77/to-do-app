import 'package:flutter/material.dart';
import 'package:todo/features/archived_tasks/views/widgets/arciheved_tasks_body.dart';

import '../../../core/colorCore.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
    );
  }
}
