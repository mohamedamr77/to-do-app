import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/features/regester/views/regester_screen.dart';
import 'features/onboarding/views/onboarding_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        CustomRegesterScreen.id: (context) => const CustomRegesterScreen(),
        CustomOnboarding.id: (context) => const CustomOnboarding(),
        // HomePageScreen.id: (context) =>  HomePageScreen(),
      },
      initialRoute:   CustomOnboarding.id,
      debugShowCheckedModeBanner: false,
    );
  }
}
