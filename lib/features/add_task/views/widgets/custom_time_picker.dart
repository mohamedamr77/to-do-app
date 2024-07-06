import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      color: Colors.white,
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
        leading: SvgPicture.asset("assets/images/svg/timeicon.svg"),
        title: const Text("Add Time",
          style: TextStyle(
            color: Color(0xff423F3F),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "LexendDecaRegularStyle",
          ),
        ),
        subtitle: const Text("Set a Time For The Task",
          style: TextStyle(
            color: Color(0xffB6B4BD), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: "LexendDecaRegularStyle",
          ),
        ),
        trailing: SvgPicture.asset("assets/images/svg/Arrow - Down .svg"),
      ),
    );
  }
}
