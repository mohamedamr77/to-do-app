import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/onboarding/views/onboarding_screen.dart';
import 'features/regester/views/regester_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:CustomRegesterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
