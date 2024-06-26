
import 'package:flutter/material.dart';
import '../../../../core/colorCore.dart';

import '../../../regester/views/regester_screen.dart';

class CustomButtonStarted extends StatelessWidget {
   CustomButtonStarted({super.key,required this.text,required this.trailing});

    String text;
    Widget?  trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Stack(
          alignment: Alignment.centerRight,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomRegesterScreen(),));
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 14),
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
                child:  Text(text,
                  style:const TextStyle(
                    fontSize: 19,
                    fontFamily: "LexendDeca",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: trailing,
            ),
          ]
      ),
    );
  }
}
