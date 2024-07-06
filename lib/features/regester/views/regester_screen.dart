import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/features/home_page/views/HomePageScreen.dart';
import 'package:todo/features/regester/views/widgets/enter_name.dart';
import '../../../core/imageCore.dart';
import '../../../cubit/get _name_and_picture_cubit/get_info_cubit.dart';
import '../../onboarding/views/widgets/button_Started.dart';

class CustomRegesterScreen extends StatefulWidget {
  const CustomRegesterScreen({super.key});
  static String id = "Register Screen";

  @override
  State<CustomRegesterScreen> createState() => _CustomRegesterScreenState();
}

class _CustomRegesterScreenState extends State<CustomRegesterScreen> {
  XFile? myPhoto;
  final ImagePicker picker = ImagePicker();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image(image: AssetImage(ImageApp.regesterImage)),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3353,
                            height:
                            MediaQuery.of(context).size.height * 0.16,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(colors: [
                                  ColorApp.skyBlueColor,
                                  ColorApp.lightPurpleColor,
                                ])),
                          ),
                          GestureDetector(
                            onTap: () async {
                              XFile? image =
                              await picker.pickImage(source: ImageSource.gallery);
                              if (image != null) {
                                myPhoto = image;
                                context.read<GetInfoCubit>().setPicture(File(image.path));
                                setState(() {});
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width *
                                  0.325, //width=128
                              height: MediaQuery.of(context).size.height *
                                  0.156, //height=118
                              decoration: BoxDecoration(
                                color: ColorApp.whiteColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return const LinearGradient(colors: [
                                    ColorApp.skyBlueColor,
                                    ColorApp.mediumBlueColor,
                                  ]).createShader(bounds);
                                },
                                child: myPhoto == null
                                    ? Icon(
                                  Icons.add_a_photo,
                                  color: ColorApp.whiteColor,
                                  size: 40,
                                )
                                    : ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.file(
                                    File(myPhoto!.path),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () async {
                      XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        myPhoto = image;
                        context.read<GetInfoCubit>().setPicture(File(image.path));
                        setState(
                                () {

                        });
                      }
                    },
                    child: Text(
                      myPhoto == null ? 'Add Photo' : 'Update Photo',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorApp.slateGrayColor,
                        fontFamily: "LexendDecaRegularStyle",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              EnterName(controller: nameController),
              CustomButtonStarted(
                text: 'Get Started',
                trailing: null,
                onTap: () {
                  context.read<GetInfoCubit>().setName(nameController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePageScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
