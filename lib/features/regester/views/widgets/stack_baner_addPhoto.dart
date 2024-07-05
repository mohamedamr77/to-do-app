import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/colorCore.dart';
import '../../../../core/imageCore.dart';
import '../../../../core/textCore.dart';

class CustomStackBannerAddPhoto extends StatefulWidget {
  const CustomStackBannerAddPhoto({super.key});

  @override
  State<CustomStackBannerAddPhoto> createState() => _CustomStackBannerAddPhotoState();
}

class _CustomStackBannerAddPhotoState extends State<CustomStackBannerAddPhoto> {
  XFile ? myPhoto ;
  final ImagePicker picker = ImagePicker();
  Future<XFile?>   pickImage( ) async{
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
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

                          child: myPhoto==null? Icon(
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

        SizedBox(height: 5,),

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
    style: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorApp.slateGrayColor,
    fontFamily: "LexendDecaRegularStyle",
        ),
    ),
        ),
      ],
    );
  }
}
