import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/colorCore.dart';
import 'dialog_buttons.dart';
import 'task_card.dart';

class DismissibleTask extends StatelessWidget {
  const DismissibleTask({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (direction) => _confirmDismissTask(direction, context),
      background: _buildDismissBackground(),
      child: TaskCard(index: index),
    );
  }

  Widget _buildDismissBackground() {
    return Card(
      color: const Color(0xffBD5461),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ListTile(
          leading: SvgPicture.asset("assets/images/svg/dele_dismissible.svg"),
        ),
      ),
    );
  }

  Future<bool?> _confirmDismissTask(DismissDirection direction, BuildContext context) async {
    if (direction == DismissDirection.startToEnd) {
      return await showDialog<bool>(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Delete"),
            content: Text("Are you sure you want to delete this item?"),
            actions: [
              DialogButton(text: "Cancel", result: false, color: ColorApp.appbarHomeScreenColor),
              DialogButton(text: "Delete", result: true, color: Colors.red),
            ],
          );
        },
      );
    }
    return false;
  }
}
