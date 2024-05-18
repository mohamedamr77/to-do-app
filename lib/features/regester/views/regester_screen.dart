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
            Image(image: AssetImage(AppImage.regesterImage)),
          ],
        ),
    );
  }
}
