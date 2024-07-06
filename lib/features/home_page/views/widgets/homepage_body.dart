import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/data/model/task_list.dart';
import 'package:todo/core/imageCore.dart';


class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key, required this.name, required this.pictureUser});
    final String name;
    final File pictureUser;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 23,horizontal: 12),
          color: ColorApp.appbarHomeScreenColor,
          child: Row(
            children: [
              GestureDetector(
                onTap: (){
                  Scaffold.of(context).openDrawer();
                },
                child: SvgPicture.asset(ImageApp.menuImage),
              ),
              const SizedBox(width: 15,),
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Hello!",
                    style: TextStyle(
                      color: ColorApp.textAppbarHomeScreenColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'LexendDeca',
                    ),
                    ),
                    Text(name,
                    style: const TextStyle(
                      color: ColorApp.textAppbarHomeScreenColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'LexendDeca',
                    ),
                    ),
                    const SizedBox(height: 12,),
                    const Text("Saturday, May 25th",
                      style: TextStyle(
                        color: ColorApp.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'LexendDeca',
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: ColorApp.whiteColor,
                  ),
                  CircleAvatar(
                    radius: 26,
                    backgroundImage: FileImage(
                      File(pictureUser.path),),
                  ),
                ],
              ),
              const SizedBox(width: 10,),
              ]
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) {
              //Color(0xffBD5461),
              // SvgPicture.asset("assets/images/svg/dele_dismissible.svg"),
              return Dismissible(
                confirmDismiss: (DismissDirection direction) async{
                  if(direction==DismissDirection.startToEnd){
                    return await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Delete"),
                            content: Text("Are you sure you want to delete this item?"),
                            actions: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop(false);
                          },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 7,horizontal: 14),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: ColorApp.appbarHomeScreenColor
                                  ),
                                  child: Text("Cancel",
                                    style: TextStyle(
                                      color: ColorApp.whiteColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "LexendDecaRegularStyle",

                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 7,horizontal: 14),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.red
                                  ),
                                  child: Text("Delete",
                                    style: TextStyle(
                                      color: ColorApp.whiteColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "LexendDecaRegularStyle",

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );;
                        },
                    );
                  }
                },
                background: Card(
                  color:Color(0xffBD5461) ,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ListTile(
                      leading:  SvgPicture.asset("assets/images/svg/dele_dismissible.svg",),
                    ),
                  ),
                ),
                key: GlobalKey(),
                /*
                TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'LexendDecaRegularStyle',
                          color: ColorApp.subtitleListTileHomeScreenColor,
                        ),
                 */
                child: Card(
                  color: ColorApp.whiteColor,
                  child: ListTile(
                      leading: SvgPicture.asset(ImageApp.leadingItemDismissibleImage),
                      title:  Text('${tasksList[index].tasknameControllerRegester.text}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'LexendDecaRegularStyle',
                          color: Color(0xff24252C),
                        ),

                      ),
                      subtitle:  Text(
                        tasksList[index].timeOfTask.hour>=1&&  tasksList[index].timeOfTask.hour<=12?
                        '${tasksList[index].timeOfTask.hour} : ${tasksList[index].timeOfTask.minute} AM':
                        '${tasksList[index].timeOfTask.hour-12} : ${tasksList[index].timeOfTask.minute} PM'
                        ,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'LexendDecaRegularStyle',
                          color: ColorApp.subtitleListTileHomeScreenColor,
                        ),
                      ),
                      trailing: GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 7,horizontal: 14),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: ColorApp.appbarHomeScreenColor
                          ),
                          child: Text("Done",
                            style: TextStyle(
                              color: ColorApp.whiteColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              fontFamily: "LexendDecaRegularStyle",

                            ),
                          ),
                        ),
                      )
                  ),
                ),
              );
            },
          itemCount:  tasksList.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 10,
              );
          },

          ),
        ),
      ],
    );
  }
}
