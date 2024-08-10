import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomPage extends StatelessWidget {
  CustomPage({super.key, required this.startDateSelectedDate});
  DateTime startDateSelectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text(
              'Selected date: ${DateFormat('dd MMM, yyyy').format(startDateSelectedDate)}'),
        ),
      ),
    );
  }
}
