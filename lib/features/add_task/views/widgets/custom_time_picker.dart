import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/imageCore.dart';
import '../../../../core/textCore.dart';

class CustomTimePicker extends StatefulWidget {
   CustomTimePicker({super.key,required this.selectedTime, required this.onTimeSelected});
   TimeOfDay? selectedTime;
   final Function(TimeOfDay) onTimeSelected;
  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Theme.of(context).cardColor,
      child: ListTile(
        onTap: () async{
          final TimeOfDay? timeOfDay= await showTimePicker(
              context: context,
              initialTime: widget.selectedTime??TimeOfDay.now(),
             initialEntryMode: TimePickerEntryMode.dial,
          );
          if(timeOfDay!=null){
            setState(() {
              widget.selectedTime=timeOfDay;
              widget.onTimeSelected(timeOfDay);
            });
          }

          if (kDebugMode) {
            print(widget.selectedTime);
          }
        },
        leading: Theme.of(context).canvasColor==Colors.black?
        SvgPicture.asset("assets/images/svg/timeicon.svg") : SvgPicture.asset("assets/images/svg/fluent-emoji-flat_watch_blackmode.svg"),
        title:  Text(
          widget.selectedTime==null? "Add time" : _formatTaskTime(widget.selectedTime!),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        subtitle:   Text(TextApp.setTimeForTaskText,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        trailing: SvgPicture.asset(ImageApp.arrowDownImage,
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

