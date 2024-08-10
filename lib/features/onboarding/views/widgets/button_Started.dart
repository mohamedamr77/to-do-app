//done
//done
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtonStarted extends StatelessWidget {
  CustomButtonStarted(
      {super.key,
      required this.text,
      required this.trailing,
      required this.onTap});

  String text;
  Widget? trailing;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: FadeInDown(
        child: Stack(alignment: Alignment.centerRight, children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 14),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).canvasColor == Colors.black
                    ? const Color(0xff90B6E2)
                    : const Color(0xff3F6188),
              ),
              child: FadeInLeftBig(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ),
          FadeInRightBig(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: trailing,
            ),
          ),
        ]),
      ),
    );
  }
}
