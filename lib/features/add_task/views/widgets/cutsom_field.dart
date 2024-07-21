import 'package:flutter/material.dart';

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
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall
          ),
          TextFormField(
            controller: controller,
            maxLines: maxLine,
            minLines: minLine,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.titleSmall,
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
