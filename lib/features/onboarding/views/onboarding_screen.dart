import 'package:flutter/material.dart';
import 'package:todo/core/imageCore.dart';

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
                
              ],
           ),
    );
  }
}
