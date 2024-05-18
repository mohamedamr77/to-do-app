import 'package:flutter/material.dart';

import '../../../../core/imageCore.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: const AssetImage(AppImage.onBoardingImage),
        width: MediaQuery.of(context).size.width*0.75,
        height: MediaQuery.of(context).size.height*0.45,
      ),
    );
  }
}
