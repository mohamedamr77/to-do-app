import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/fontfamily.dart';
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
        leading: SvgPicture.asset(ImageApp.timeIconImage),
        title:  const Text(TextApp.addTimeText,
          style: TextStyle(
            color: ColorApp.titleListTileDateOrTimeOrTextFieldColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamilyApp.lexendDecaRegular,
          ),
        ),
        subtitle:  const Text(TextApp.setTimeForTaskText,
          style: TextStyle(
            color: ColorApp.subTitleListTileDateOrTimeOrTextFiledColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily:FontFamilyApp.lexendDecaRegular,
          ),
        ),
        trailing: SvgPicture.asset(ImageApp.arrowDownImage),
      ),
    );
  }
}
