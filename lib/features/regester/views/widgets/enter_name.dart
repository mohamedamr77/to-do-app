import 'package:flutter/material.dart';
import '../../../../core/colorCore.dart';
import '../../../../core/textCore.dart';

class EnterName extends StatelessWidget {
  const EnterName({super.key, required this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.154,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  ColorApp.skyBlueColor,
                  ColorApp.lightPurpleColor,
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(22),
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              color: ColorApp.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  AppText.yourNameText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorApp.slateGrayColor,
                    fontFamily: "LexendDecaRegularStyle",
                  ),
                ),
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: AppText.enterNameText,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: "LexendDecaRegularStyle",
                      color: const Color(0xff6E6A7C).withOpacity(0.5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
