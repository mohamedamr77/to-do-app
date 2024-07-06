import 'package:flutter/material.dart';

import '../../../../core/textCore.dart';

class CustomTextBold extends StatelessWidget {
  const CustomTextBold({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.4,
      height: MediaQuery.of(context).size.height*0.09,
      child: const Text(AppText.onboardingTitleText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          fontFamily: "LexendDeca",


        ),

      ),
    );
  }
}
