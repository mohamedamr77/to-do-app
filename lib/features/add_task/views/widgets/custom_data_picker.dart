import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/imageCore.dart';
import '../../../../core/textCore.dart';

class CustomDataPicker extends StatefulWidget {
  CustomDataPicker({
    super.key,
    required this.title,
    required this.subTitle,
    required this.selectedDate,
    required this.onDateSelected, @required this.clickInButton,
  });

  final String title;
  final String subTitle;
  DateTime? selectedDate;
  final Function(DateTime) onDateSelected;
   bool? clickInButton;

  @override
  State<CustomDataPicker> createState() => _CustomDataPickerState();
}

class _CustomDataPickerState extends State<CustomDataPicker> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: ListTile(
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: widget.selectedDate ?? DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2025),
          );
          if (picked != null && picked != widget.selectedDate) {
            setState(() {
              widget.selectedDate = picked;
            });
            widget.onDateSelected(picked);
          }
        },
        leading: SvgPicture.asset(ImageApp.calendarImage),
        title: Text(
          widget.selectedDate == null
              ? (widget.title == TextApp.startText ? TextApp.startText : TextApp.endDateText)
              : "${widget.selectedDate!.toLocal()}".split(' ')[0],
          style: Theme.of(context).textTheme.bodySmall,
        ),
        subtitle: Text(
          widget.subTitle,
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
