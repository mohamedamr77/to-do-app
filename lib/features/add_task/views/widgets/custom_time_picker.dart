import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/imageCore.dart';
import '../../../../core/textCore.dart';

class CustomTimePicker extends StatefulWidget {
   CustomTimePicker({super.key,required this.selectedTime});
  TimeOfDay selectedTime;
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
              initialTime: widget.selectedTime,
             initialEntryMode: TimePickerEntryMode.dial,
          );
          if(timeOfDay!=null){
            setState(() {
              widget.selectedTime=timeOfDay;
            });
          }
          print(widget.selectedTime);
        },
        leading: Theme.of(context).canvasColor==Colors.black?
        SvgPicture.asset("assets/images/svg/timeicon.svg") : SvgPicture.asset("assets/images/svg/fluent-emoji-flat_watch_blackmode.svg"),
        title:  Text(TextApp.addTimeText,
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
