import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/features/done_tasks/views/screen.dart';

import '../../../archived_tasks/views/screen.dart';

class DialogBody extends StatelessWidget {
  const DialogBody({super.key, required this.name, required this.pictureUser});
  final String name;
  final File pictureUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.whiteColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            height: 160,
            color: ColorApp.primaryColor,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SafeArea(
                child: Row(
                  children: [
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
                    Text(name,
                    style: const TextStyle(
                      color: ColorApp.whiteColor,
                      fontFamily: "LexendDecaRegularStyle",
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                    )
                  ],
                ),
              ),
            ),
          ),
         Expanded(
           child: ListView(
             children: [
               Card(
                 color: const Color(0xffE8EFF2),
                 child: ListTile(
                   onTap:(){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const ArchivedTasksScreen(),));
                   },
                   leading: SvgPicture.asset("assets/images/svg/archievetaskIcon.svg"),
                   title: const Text("Archived Tasks",
                     style: TextStyle(
                       color: Color(0xff739CCB),
                       fontFamily: "LexendDecaRegularStyle",
                       fontSize: 16,
                       fontWeight: FontWeight.w500
                     ),
                   ),
                 ),
               ),
               const SizedBox(height: 10,),
               Card(
                 color: const Color(0xffE8EFF2),
                 child: ListTile(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const DoneTaskScreen(),));
                   },
                   leading: SvgPicture.asset("assets/images/svg/doneTaskIcon.svg"),
                   title: const Text("Done Task",
                     style: TextStyle(
                       color: Color(0xff739CCB),
                       fontFamily: "LexendDecaRegularStyle",
                       fontSize: 16,
                       fontWeight: FontWeight.w500
                     ),
                   ),
                 ),
               ),
             ],
           ),
         )
        ],
      ),
    );
  }
}
