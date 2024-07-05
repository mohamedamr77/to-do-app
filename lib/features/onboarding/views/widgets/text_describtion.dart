import 'package:flutter/material.dart';

import '../../../../core/colorCore.dart';
import '../../../../core/textCore.dart';

class CustomTextDescription extends StatelessWidget {
  const CustomTextDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.75,
      height: MediaQuery.of(context).size.height*0.1,
      child: Text(AppText.onboardingDescriptionText.trim(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: ColorApp.greyColor,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          fontFamily: "LexendDecaRegularStyle",
        ),
      ),
    );
  }
}
