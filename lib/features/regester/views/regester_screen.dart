import 'package:flutter/material.dart';
import 'package:todo/core/imageCore.dart';

class CustomRegesterScreen extends StatelessWidget {
  const CustomRegesterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
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
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [
                            Color(0xff74B3E3),
                            Color(0xffCDADD2),
                          ]
                      )
                  ),
                ),
                  Container(
                    width: 118,
                    height: 118,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ShaderMask(

                      shaderCallback: (Rect bounds) {
                        return LinearGradient(colors: [
                              Color(0xff76B3E3),
                              Color(0xff68A2D0),
                        ]).createShader(bounds);
                      },
                      child: Icon(Icons.add_a_photo,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  )
                ]
              ),
            ]
            ),

          ],
        ),
    );
  }
}
