import 'package:flutter/material.dart';
import '../../../../core/colorCore.dart';
import '../../../../core/textCore.dart';

class EnterName extends StatelessWidget {
  const EnterName({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
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
                  gradient: const LinearGradient(
                      colors: [
                        AppColor.skyBlueColor,
                        AppColor.lightPurpleColor,
                      ]
                  )
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(22),
              width: MediaQuery.of(context).size.width-50,
              // width: 118,
              // height: 118,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child:

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(AppText.yourNameText,
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
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: "LexendDecaRegularStyle",
                      color: const Color(0xff6E6A7C).withOpacity(0.5),
                      )
                    ),
                  ),
                ],
              ) ,
            ),
          ]
      ),
    );
  }
}
