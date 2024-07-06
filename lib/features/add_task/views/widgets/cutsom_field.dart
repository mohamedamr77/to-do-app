import 'package:flutter/material.dart';
import 'package:todo/core/colorCore.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.title,
    required this.hintText,
    required this.minLine,
    required this.maxLine,
    required this.controller,
    required this.validator,
  });

  final String title;
  final String hintText;
  final int minLine;
  final int maxLine;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorApp.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
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
                color: const Color(0xff6e6a7c80).withOpacity(0.5),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: "LexendDecaRegularStyle",
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
