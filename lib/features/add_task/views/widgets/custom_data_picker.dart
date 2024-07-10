import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/fontfamily.dart';
import 'package:todo/core/imageCore.dart';

// ignore: must_be_immutable
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

          },
        leading: SvgPicture.asset(ImageApp.calendarImage),
        title:  Text(widget.title,
          style: const TextStyle(
            color: ColorApp.titleListTileDateOrTimeOrTextFieldColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamilyApp.lexendDecaRegular,
          ),
        ),
        subtitle:  Text(widget.subTitle,
          style: const TextStyle(
            color: ColorApp.subTitleListTileDateOrTimeOrTextFiledColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamilyApp.lexendDecaRegular,
          ),
        ),
        trailing: SvgPicture.asset(ImageApp.arrowDownImage),
      ),
    );
  }
}
