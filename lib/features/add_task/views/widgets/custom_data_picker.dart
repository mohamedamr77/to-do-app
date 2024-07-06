import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDataPicker extends StatefulWidget {
   CustomDataPicker({super.key, required this.title, required this.subTitle, required this.selectedDate});
    final String title;
    final String subTitle;
     DateTime selectedDate;


  @override
  State<CustomDataPicker> createState() => _CustomDataPickerState();
}

class _CustomDataPickerState extends State<CustomDataPicker> {


  @override
  Widget build(BuildContext context) {
    return   Card(
      color: Colors.white,
      child: ListTile(
        onTap: () async{
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: widget.selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2025),
                );
                if (picked!= null && picked!= widget.selectedDate) {
                  setState(() {
                    widget.selectedDate = picked;
                  });
                }
                print(widget.selectedDate);
          },
        leading: SvgPicture.asset("assets/images/svg/calendar.svg"),
        title:  Text(widget.title,
          style: TextStyle(
            color: Color(0xff423F3F),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "LexendDecaRegularStyle",
          ),
        ),
        subtitle:  Text(widget.subTitle,
          style: TextStyle(
            color: Color(0xffB6B4BD),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: "LexendDecaRegularStyle",
          ),
        ),
        trailing: SvgPicture.asset("assets/images/svg/Arrow - Down .svg"),
      ),
    );
  }
}
