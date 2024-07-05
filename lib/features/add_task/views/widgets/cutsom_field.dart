import 'package:flutter/material.dart';
import 'package:todo/core/colorCore.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key, required this.title, required this.hintText, required this.minLine, required this.maxLine, required this.controller});
    final String title;
    final String hintText;
    final int minLine;
    final int maxLine;
    final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorApp.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
          style: TextStyle(
            color: Color(0xff423F3F),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "LexendDecaRegularStyle",
          ),
          ),
          TextFormField(
            controller: controller,
            maxLines: maxLine,
            minLines: minLine,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Color(0xff6E6A7C80).withOpacity(0.5),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: "LexendDecaRegularStyle",
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }
}
