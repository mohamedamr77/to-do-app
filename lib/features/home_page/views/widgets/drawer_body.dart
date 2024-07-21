import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/colorCore.dart';
import 'package:todo/core/fontfamily.dart';
import 'package:todo/core/imageCore.dart';
import 'package:todo/core/textCore.dart';
import 'package:todo/cubit/theme/get_cubit.dart';
import 'package:todo/features/done_tasks/views/screen.dart';
import '../../../archived_tasks/views/screen.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key, required this.name, required this.pictureUser});
  final String? name;
  final File? pictureUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            height: 160,
            color: Theme.of(context).indicatorColor,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SafeArea(
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar
                          (
                            radius: 30,
                            backgroundColor: Theme.of(context).canvasColor == Colors.white ? const Color(0xff335072) : Colors.white
                        ),
                        CircleAvatar(
                          radius: 26,
                          backgroundImage: FileImage(File(pictureUser!.path)),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10,),
                    Text(name!,
                      style: const TextStyle(
                          color: ColorApp.whiteColor,
                          fontFamily: FontFamilyApp.lexendDecaRegular,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView(
                children: [
                  Card(
                    color: Theme.of(context).cardColor,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ArchivedTasksScreen()));
                      },
                      leading: SvgPicture.asset(ImageApp.archieveIcon,
                        color: Theme.of(context).canvasColor == Colors.white ? Colors.white : const Color(0xff739CCB),
                      ),
                      title: Text(TextApp.archivedTasksText,
                        style: Theme.of(context).canvasColor == Colors.white
                            ? const TextStyle(
                            color: Color(0xffF0F0F0),
                            fontFamily: FontFamilyApp.lexendDecaRegular,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        )
                            : const TextStyle(
                            color: ColorApp.drawerTextCardColor,
                            fontFamily: FontFamilyApp.lexendDecaRegular,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Card(
                    color: Theme.of(context).cardColor,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DoneTaskScreen()));
                      },
                      leading: SvgPicture.asset(ImageApp.doneIcon,
                        color: Theme.of(context).canvasColor == Colors.white ? Colors.white : const Color(0xff739CCB),
                      ),
                      title: Text(TextApp.doneTasksText,
                        style: Theme.of(context).canvasColor == Colors.white
                            ? const TextStyle(
                            color: Color(0xffF0F0F0),
                            fontFamily: FontFamilyApp.lexendDecaRegular,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        )
                            : const TextStyle(
                            color: ColorApp.drawerTextCardColor,
                            fontFamily: FontFamilyApp.lexendDecaRegular,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Card(
                    color: Theme.of(context).cardColor,
                    child: ListTile(
                      leading: Icon(Icons.dark_mode,
                        color: Theme.of(context).canvasColor == Colors.white ? Colors.white : const Color(0xff739CCB),
                      ),
                      title: Text("Dark Mode",
                        style: Theme.of(context).canvasColor == Colors.white
                            ? const TextStyle(
                            color: Color(0xffF0F0F0),
                            fontFamily: FontFamilyApp.lexendDecaRegular,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        )
                            : const TextStyle(
                            color: ColorApp.drawerTextCardColor,
                            fontFamily: FontFamilyApp.lexendDecaRegular,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Switch(
                        value: BlocProvider.of<GetThemeCubit>(context).isDark,
                        onChanged: (bool value) {
                          BlocProvider.of<GetThemeCubit>(context).changeTheme(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
