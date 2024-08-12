import 'package:flutter/material.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/fontfamily.dart';

class DialogButton extends StatelessWidget {
  const DialogButton(
      {super.key,
      required this.text,
      required this.result,
      required this.color,required this.onTap});
  final String text;
  final bool result;
  final Color color;
 final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: color,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: ColorApp.whiteColor,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontFamily: FontFamilyApp.lexendDecaRegular,
          ),
        ),
      ),
    );
  }
}
