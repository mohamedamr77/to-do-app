import 'package:flutter/material.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/textCore.dart';
import '../../regester/views/regester_screen.dart';
import 'widgets/baner.dart';
import 'widgets/button_Started.dart';
import 'widgets/text_bold.dart';
import 'widgets/text_describtion.dart';

class CustomOnboarding extends StatelessWidget {
  const CustomOnboarding({super.key});
  static String id = "OnBoarding Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomBanner(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const CustomTextBold(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const CustomTextDescription(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomButtonStarted(
              text: TextApp.startText,
              trailing: Image.asset(ImageApp.arrowStartImage),
              onTap: () {
                Navigator.pushNamed(context, CustomRegesterScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
