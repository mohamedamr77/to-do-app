import 'package:flutter/material.dart';
import '../../../../core/textCore.dart';

class EnterName extends StatelessWidget {
  const EnterName({super.key, required this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(22),
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: const Color(0xff87B5E3)
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  TextApp.yourNameText,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: TextApp.enterNameText,
                    border: InputBorder.none,
                    hintStyle: Theme.of(context).textTheme.titleSmall
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty ) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
