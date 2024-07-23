//done
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../core/imageCore.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDownBig(
      child: Center(
        child: Image(
          image: const AssetImage(ImageApp.onBoardingImage),
          width: MediaQuery.of(context).size.width*0.75,
          height: MediaQuery.of(context).size.height*0.45,
        ),
      ),
    );
  }
}
