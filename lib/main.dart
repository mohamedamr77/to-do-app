import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/get%20_name_and_picture_cubit/get_info_cubit.dart';
import 'package:todo/features/home_page/views/HomePageScreen.dart';
import 'package:todo/features/regester/views/regester_screen.dart';

import 'features/onboarding/views/onboarding_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetInfoCubit(),
      child: MaterialApp(
        routes: {
          CustomRegesterScreen.id: (context) => const CustomRegesterScreen(),
          CustomOnboarding.id: (context) => const CustomOnboarding(),
          // HomePageScreen.id: (context) =>  HomePageScreen(),
        },
        initialRoute: CustomOnboarding.id,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
