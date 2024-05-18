import 'package:flutter/material.dart';
import 'package:todo/core/colorCore.dart';
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
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                SizedBox(
                   width: MediaQuery.of(context).size.width*0.75,
                   height: MediaQuery.of(context).size.height*0.1,
                   child: Text(AppText.onboardingDescriptionText.trim(),
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: AppColor.greyColor,
                     fontWeight: FontWeight.w400,
                     fontSize: 14,
                     fontFamily: "LexendDecaRegularStyle",
                   ),
                   ),
                 ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Padding(
                  padding: const EdgeInsets.all(22),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                   AppColor.lightBlueColor,
                                   AppColor.shadeOfPinkColor.withOpacity(0.5),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              )
                          ),
                          child: Text(AppText.startText,
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: "LexendDeca",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(AppImage.arrowStartImage),
                      ),
                    ]
                  ),
                )
              ],
           ),
    );
  }
}
