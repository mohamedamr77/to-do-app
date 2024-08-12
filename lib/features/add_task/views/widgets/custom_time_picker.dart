import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/imageCore.dart';
import '../../../../core/textCore.dart';

class CustomTimePicker extends StatefulWidget {
  CustomTimePicker({
    super.key,
    required this.selectedTime,
    required this.onTimeSelected,
    @required this.clickInButton,
  });

  String? selectedTime; // Changed to String?
  final Function(String) onTimeSelected; // Changed to accept a String
  bool? clickInButton;

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: ListTile(
        onTap: () async {
          final TimeOfDay? timeOfDay = await showTimePicker(
            context: context,
            initialTime: widget.selectedTime != null
                ? _parseTimeOfDay(widget.selectedTime!)
                : TimeOfDay.now(),
            initialEntryMode: TimePickerEntryMode.dial,
          );
          if (timeOfDay != null) {
            setState(() {
              widget.selectedTime = _formatTaskTime(timeOfDay);
              widget.onTimeSelected(widget.selectedTime!);
            });
          }

          if (kDebugMode) {
            print(widget.selectedTime);
          }
        },
        leading: Theme.of(context).canvasColor == Colors.black
            ? SvgPicture.asset("assets/images/svg/timeicon.svg")
            : SvgPicture.asset(
            "assets/images/svg/fluent-emoji-flat_watch_blackmode.svg"),
        title: Text(
          widget.selectedTime == null
              ? "Add time"
              : widget.selectedTime!,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        subtitle: Text(
          TextApp.setTimeForTaskText,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        trailing: SvgPicture.asset(
          ImageApp.arrowDownImage,
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
  }
}

String _formatTaskTime(TimeOfDay time) {
  final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
  final minute = time.minute.toString().padLeft(2, '0');
  final period = time.hour < 12 ? TextApp.amText : TextApp.pmText;
  return '$hour:$minute $period';
}

// Helper function to parse a TimeOfDay from a string
TimeOfDay _parseTimeOfDay(String timeString) {
  final format = timeString.split(RegExp(r'[: ]'));
  final hour = int.parse(format[0]);
  final minute = int.parse(format[1]);
  final period = format[2].toLowerCase();
  return TimeOfDay(
    hour: period == 'pm' && hour != 12 ? hour + 12 : hour,
    minute: minute,
  );
}
