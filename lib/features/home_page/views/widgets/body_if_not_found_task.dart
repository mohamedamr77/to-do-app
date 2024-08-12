import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BodyIfNotFoundTask extends StatelessWidget {
  const BodyIfNotFoundTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Not Item's Now \n Click Bottom And Add Task",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).canvasColor,
            fontSize: 16,
            fontFamily: "jejuhallasan",
          ),
        ),
        Lottie.asset(
          "assets/images/lottie/see_down.json",
          width: 300,
          height: 300,
        ),
        const SizedBox(
          height: 60,
        )
      ],
    );
  }
}
