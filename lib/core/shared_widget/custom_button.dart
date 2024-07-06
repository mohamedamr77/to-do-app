import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.backGroundColor,
    required this.nameButton,
    required this.onTap,
    this.image,
  }) : super(key: key);

  final void Function()? onTap;
  final Color backGroundColor;
  final String nameButton;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nameButton,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "LexendDeca",
              ),
            ),
            if (image != null) ...[
              SizedBox(width: 10),
              SvgPicture.asset(image!)
            ],
          ],
        ),
      ),
    );
  }
}
