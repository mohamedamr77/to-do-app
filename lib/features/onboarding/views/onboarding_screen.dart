import 'package:flutter/material.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/textCore.dart';



import 'widgets/baner.dart';
import 'widgets/button_Started.dart';
import 'widgets/text_bold.dart';
import 'widgets/text_describtion.dart';

class CustomOnboarding extends StatelessWidget {
  const CustomOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomBanner(),
                SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                CustomTextBold(),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                CustomTextDescription(),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                CustomButtonStarted(text: AppText.startText, trailing: Image.asset(AppImage.arrowStartImage),),
              ],
           ),
    );
  }
}
