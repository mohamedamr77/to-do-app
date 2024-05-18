import 'package:flutter/material.dart';
import '../../../../core/colorCore.dart';
import '../../../../core/imageCore.dart';
import '../../../../core/textCore.dart';

class CustomButtonStarted extends StatelessWidget {
  const CustomButtonStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
