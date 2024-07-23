//done
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../core/textCore.dart';

class CustomTextDescription extends StatelessWidget {
  const CustomTextDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.75,
      height: MediaQuery.of(context).size.height*0.1,
      child: FadeInRightBig(
        child: Text(TextApp.onboardingDescriptionText.trim(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium
        ),
      ),
    );
  }
}
