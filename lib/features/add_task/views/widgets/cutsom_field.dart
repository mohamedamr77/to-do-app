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
    @required this.onSaved,
  });

  final String title;
  final String hintText;
  final int minLine;
  final int maxLine;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final void Function(String?)? onSaved;

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
            onSaved: onSaved,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14
            ),
            maxLines: maxLine,
            minLines: minLine,
            onTapOutside: (e){
              FocusManager.instance.primaryFocus?.unfocus();
            },
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
