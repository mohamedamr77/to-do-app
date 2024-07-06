import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/textCore.dart';
import 'package:todo/features/home_page/views/HomePageScreen.dart';
import 'package:todo/features/regester/views/widgets/enter_name.dart';
import '../../../core/imageCore.dart';
import '../../onboarding/views/widgets/button_Started.dart';

class CustomRegesterScreen extends StatefulWidget {
  const CustomRegesterScreen({super.key});
  static String id="Register Screen";

  @override
  State<CustomRegesterScreen> createState() => _CustomRegesterScreenState();
}

class _CustomRegesterScreenState extends State<CustomRegesterScreen> {
  XFile ? myPhoto ;
  final ImagePicker picker = ImagePicker();
  Future<XFile?>   pickImage( ) async{
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical:  MediaQuery.of(context).size.height*0.05),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Column(
                children: [
                  Stack(
                      alignment: Alignment.bottomCenter,
                      children: [

                        const Image(image: AssetImage(ImageApp.regesterImage)),

                        Stack(
                            alignment: Alignment.center,
                            children:[
                              Container(
                                width: MediaQuery.of(context).size.width*0.3353,
                                height: MediaQuery.of(context).size.height*0.16,
                                //   width: 120,
                                // height: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                        colors: [
                                          ColorApp.skyBlueColor,
                                          ColorApp.lightPurpleColor,
                                        ]
                                    )
                                ),
                              ),

                              GestureDetector(
                                onTap: (){
                                  pickImage().then((value){
                                    myPhoto = value;
                                    setState(() {});
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.325, //width=128
                                  height: MediaQuery.of(context).size.height*0.156, //height=118
                                  decoration: BoxDecoration(
                                    color: ColorApp.whiteColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),

                                  child: ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const LinearGradient(colors: [
                                        ColorApp.skyBlueColor,
                                        ColorApp.mediumBlueColor,
                                      ]
                                      ).createShader(bounds);
                                    },

                                    child: myPhoto==null? const Icon(
                                      Icons.add_a_photo,
                                      color:  ColorApp.whiteColor,
                                      size: 40,
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.file(File(myPhoto!.path),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        ),


                      ]
                  ),

                  const SizedBox(height: 5,),

                  TextButton(
                    onPressed: () {
                      pickImage().then((value){
                        myPhoto = value;
                        setState(() {});
                      });
                    },
                    child:  Text( myPhoto==null?
                    AppText.addPhotoText:
                    "Update photo"
                      ,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorApp.slateGrayColor,
                        fontFamily: "LexendDecaRegularStyle",
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5,),

              EnterName(controller: nameController,),

              CustomButtonStarted(text: 'Get Started ', trailing: null,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      HomePageScreen (
                        name: nameController.text,
                        photo: File(myPhoto!.path),
                      )
                  )
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