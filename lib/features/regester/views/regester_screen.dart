import 'package:flutter/material.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/textCore.dart';

import '../../onboarding/views/widgets/button_Started.dart';

class CustomRegesterScreen extends StatelessWidget {
  const CustomRegesterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                Image(image: AssetImage(AppImage.regesterImage)),
          
                Stack(
                  alignment: Alignment.center,
                  children:[
                    Container(
                    width: MediaQuery.of(context).size.width*0.3353,
                    height: MediaQuery.of(context).size.height*0.16,
                    //   width: 120,
                    // height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [
                               AppColor.skyBlueColor,
                               AppColor.lightPurpleColor,
                            ]
                        )
                    ),
                  ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.325,
                      height: MediaQuery.of(context).size.height*0.156,
                      // width: 118,
                      // height: 118,
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ShaderMask(
          
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(colors: [
                                AppColor.skyBlueColor,
                                 AppColor.mediumBlueColor,
                          ]
                          ).createShader(bounds);
                        },
                        child: Icon(Icons.add_a_photo,
                          color:  AppColor.whiteColor,
                          size: 40,
                        ),
                      ),
                    )
                  ]
                ),
          
          
              ]
              ),
              SizedBox(height: 5,),
              Text(AppText.addPhotoText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.slateGrayColor,
                  fontFamily: "LexendDecaRegularStyle",
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Stack(
                    alignment: Alignment.center,
                    children:[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.154,
                        //   width: 120,
                        // height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [
                                  AppColor.skyBlueColor,
                                  AppColor.lightPurpleColor,
                                ]
                            )
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(22),
                        width: MediaQuery.of(context).size.width-50,

                        // width: 118,
                        // height: 118,
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppText.yourNameText,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.slateGrayColor,
                                fontFamily: "LexendDecaRegularStyle",
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                               hintText: AppText.enterNameText,
                                border: InputBorder.none,
                              ),
                            ),
                          ],
                        ) ,
                      ),
                    ]
                ),
              ),
          
              CustomButtonStarted(),
          
            ],
          ),
        ),
    );
  }
}
