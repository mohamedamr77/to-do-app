import 'package:flutter/material.dart';

import '../../../../core/colorCore.dart';
import '../../../../core/imageCore.dart';

class CustomStackBannerAddPhoto extends StatelessWidget {
  const CustomStackBannerAddPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const Image(image: AssetImage(AppImage.regesterImage)),

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
                      gradient: const LinearGradient(
                          colors: [
                            AppColor.skyBlueColor,
                            AppColor.lightPurpleColor,
                          ]
                      )
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width*0.325, //width=128
                  height: MediaQuery.of(context).size.height*0.156, //height=118

                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ShaderMask(

                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(colors: [
                        AppColor.skyBlueColor,
                        AppColor.mediumBlueColor,
                      ]
                      ).createShader(bounds);
                    },
                    child: const Icon(
                      Icons.add_a_photo,
                      color:  AppColor.whiteColor,
                      size: 40,
                    ),
                  ),
                )
              ]
          ),


        ]
    );
  }
}
