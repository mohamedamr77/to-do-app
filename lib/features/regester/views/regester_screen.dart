import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/textCore.dart';
import 'package:todo/features/regester/controller/get_cubit.dart';
import 'package:todo/features/home_page/views/HomePageScreen.dart';
import 'package:todo/features/regester/views/widgets/enter_name.dart';
import '../../../core/imageCore.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  Future<XFile?> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && myPhoto != null) {
      BlocProvider.of<GetUserCubit>(context).setName(name: nameController.text);
      BlocProvider.of<GetUserCubit>(context).setPhoto(File(myPhoto!.path));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePageScreen(),
        ),
      );
    } else {
      if (myPhoto == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a photo')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        const Image(
                          image: AssetImage(ImageApp.regesterImage),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3353,
                              height: MediaQuery.of(context).size.height * 0.16,
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
                            GestureDetector(
                              onTap: () {
                                pickImage().then((value) {
                                  myPhoto = value;
                                  setState(() {});
                                });
                              },
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.325,
                                height:
                                    MediaQuery.of(context).size.height * 0.156,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return const LinearGradient(
                                      colors: [
                                        ColorApp.skyBlueColor,
                                        ColorApp.mediumBlueColor,
                                      ],
                                    ).createShader(bounds);
                                  },
                                  child: myPhoto == null
                                      ? const Icon(
                                          Icons.add_a_photo,
                                          color: ColorApp.whiteColor,
                                          size: 40,
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                    SizedBox(height: 5.h),
                    TextButton(
                      onPressed: () {
                        pickImage().then((value) {
                          myPhoto = value;
                          setState(() {});
                        });
                      },
                      child: Text(
                          myPhoto == null
                              ? TextApp.addPhotoText
                              : "Update photo",
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                EnterName(controller: nameController),
                CustomButtonStarted(
                  text: 'Get Started ',
                  trailing: null,
                  onTap: _submitForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
