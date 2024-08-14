import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/textCore.dart';
import 'package:todo/features/home_page/views/HomePageScreen.dart';
import 'package:todo/features/regester/controller/get_cubit.dart';
import '../../regester/views/regester_screen.dart';
import 'widgets/baner.dart';
import 'widgets/button_Started.dart';
import 'widgets/text_bold.dart';
import 'widgets/text_describtion.dart';

class CustomOnboarding extends StatelessWidget {
  const CustomOnboarding({super.key});
  static String id = "OnBoarding Screen";
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetUserCubit>(context).setNameFromCubit();
    BlocProvider.of<GetUserCubit>(context).setPhotoFromCubit();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomBanner(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const CustomTextBold(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const CustomTextDescription(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomButtonStarted(
              text: TextApp.startText,
              trailing: Image.asset(ImageApp.arrowStartImage),
              onTap: () {
                BlocProvider.of<GetUserCubit>(context).image==null &&
                    BlocProvider.of<GetUserCubit>(context).name==null ?
                Navigator.pushNamed(context, CustomRegesterScreen.id):
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePageScreen(),));

              },
            ),
          ],
        ),
      ),
    );
  }
}
