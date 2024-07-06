import 'package:flutter/material.dart';

class CustomContainerShowData extends StatelessWidget {
  const CustomContainerShowData({super.key, required this.title, required this.detailsTitle});
    final String title;
    final String  detailsTitle;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
            style: TextStyle(
              color: Color(0xff423F3F),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: "LexendDecaRegularStyle",
            ),
          ),
          SizedBox(height: 7,),
          Text(detailsTitle,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: "LexendDecaRegularStyle",
              color: Color(0xff8E8E8E),
            ),
          ),
        ],
      )
      ,
    );
  }
}
