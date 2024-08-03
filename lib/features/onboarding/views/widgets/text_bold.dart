//done
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../core/textCore.dart';
import 'package:intl/intl.dart';
class CustomTextBold extends StatelessWidget {
  const CustomTextBold({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.4,
      child:  FadeInLeftBig(
        child: Text(TextApp.onboardingTitleText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,

        ),
      ),
    );
  }
}
