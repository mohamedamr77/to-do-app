import 'package:flutter/material.dart';

import 'colorCore.dart';

class AppTheme{
  static final ThemeData lightThemeData = ThemeData(
      scaffoldBackgroundColor: Colors.white.withOpacity(0.98),
      textTheme: const TextTheme(
        //24 ,   FontWeight.w600, Color(0xff24252C), "LexendDeca",
          bodyLarge: TextStyle(
            color: Color(0xff24252C),
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: "LexendDeca",
          ),
          // 14,  FontWeight.w400, Color(0xff8E8E8E), "LexendDeca",
          bodyMedium: TextStyle(
            color: Color(0xff8E8E8E),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "LexendDeca",
          ),
          //18, FontWeight.w600,  Color(0xffFFFFFF),
          labelLarge: TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: "LexendDeca",
          ),
          //14 , w400 , Color(0xff423F3F),
          bodySmall: TextStyle(
            color: Color(0xff423F3F),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "LexendDeca",
          ),
          //12 , w400 , Color(0xff6E6A7C80),
          titleSmall: TextStyle(
            color: Color(0xff6e6a7c80),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: "LexendDecaRegularStyle",
          ),
          //16 , w600,  Color(0xff24252C),
          titleMedium: TextStyle(
            color: Color(0xff24252C),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: "LexendDeca",
          ),

          labelMedium:  TextStyle(
            color: Color(0xff306BA6),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "LexendDeca",
          ),

          displayMedium:  TextStyle(
            color: Color(0xff306BA6),
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "LexendDeca",
          ),

          headlineLarge: TextStyle(
            color: Color(0xff24252C),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: "LexendDeca",
          )
      ),
      cardColor: Colors.white,
      canvasColor: Colors.black,
      indicatorColor: ColorApp.primaryColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff90B6E2),
          foregroundColor: Colors.white
      ),
      buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xff90B6E2)
      )
  );
  static  final ThemeData darkThemeData = ThemeData(
      scaffoldBackgroundColor: const Color(0xff18283A),
      textTheme:  TextTheme(
        //todoList
          bodyLarge:  const TextStyle(
            color: Color(0xffF0F0F0),
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: "LexendDeca",
          ),
          //This productive tool is designed to help you better manage your task project-wise conveniently!
          bodyMedium: const TextStyle(
            color: Color(0xffF0F0F0),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "LexendDeca",
          ),
          //Text Button
          labelLarge: const TextStyle(
            color: Color(0xffF0F0F0),
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: "LexendDeca",
          ),
          //title list tile
          bodySmall: const TextStyle(
            color: Color(0xffF0F0F0),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "LexendDeca",
          ),
          //subtitle list tile
          titleSmall: TextStyle(
            color: const Color(0xffFFFFFF).withOpacity(0.6),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: "LexendDecaRegularStyle",
          ),

          titleMedium: const TextStyle(
            color: Color(0xffF0F0F0),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: "LexendDeca",
          ),

          labelMedium:  const TextStyle(
            color: Color(0xffF0F0F0),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "LexendDeca",
          ),

          displayMedium:  const TextStyle(
            color: Color(0xffF0F0F0),
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "LexendDeca",
          ),

          headlineLarge: const TextStyle(
            color: Color(0xffF0F0F0),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: "LexendDeca",
          )
      ),
      cardColor: const Color(0xff24364B),
      canvasColor: Colors.white,
      indicatorColor: const Color(0xff2A4463),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xff3F6188),
        foregroundColor: Colors.white,
      ),
      buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xff3F6188)
      )

  );
}