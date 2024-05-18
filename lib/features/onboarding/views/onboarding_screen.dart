import 'package:flutter/material.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/textCore.dart';

class CustomOnboarding extends StatelessWidget {
  const CustomOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image(
                    image: AssetImage(AppImage.onBoardingImage),
                    width: MediaQuery.of(context).size.width*0.75,
                    height: MediaQuery.of(context).size.height*0.45,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.4,
                  height: MediaQuery.of(context).size.height*0.09,
                  child: Text(AppText.onboardingTitleText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    fontFamily: "LexendDeca",


                  ),

                  ),
                ),

              ],
           ),
    );
  }
}
