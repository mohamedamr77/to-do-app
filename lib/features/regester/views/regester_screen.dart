import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/textCore.dart';
import 'package:todo/features/regester/views/widgets/enter_name.dart';
import 'package:todo/features/regester/views/widgets/stack_baner_addPhoto.dart';
import '../../onboarding/views/widgets/button_Started.dart';

class CustomRegesterScreen extends StatelessWidget {
  const CustomRegesterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical:  MediaQuery.of(context).size.height*0.05),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CustomStackBannerAddPhoto(),

                SizedBox(height: 5,),

                Text(AppText.addPhotoText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.slateGrayColor,
                    fontFamily: "LexendDecaRegularStyle",
                  ),
                ),

                EnterName(),

                CustomButtonStarted(),


              ],
            ),
          ),
        ),
    );
  }
}
