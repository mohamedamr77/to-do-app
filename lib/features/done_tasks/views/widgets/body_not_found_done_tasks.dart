import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/shared_widget/custom_appbar.dart';

class BodyNotFoundDoneTasks extends StatelessWidget {
  const BodyNotFoundDoneTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            const CustomAppbar(title: "Done Tasks"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
            ),
            Text(
              "Not Tasks Done \n Make Task And Go to Task And Make Task Done ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).canvasColor,
                fontFamily: "jejuhallasan",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Lottie.asset("assets/images/lottie/arc3.json",
                  width: double.infinity, height: 250),
            )
          ],
        ),
      ),
    );
  }
}
