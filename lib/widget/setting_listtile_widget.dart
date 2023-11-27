import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/resource/colors/colors.dart';

// ignore: must_be_immutable
class SettingsListTileWidget extends StatelessWidget {
  String title;
  Color? color;
  SettingsListTileWidget({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 10),
      child: Container(
        height: Get.height / 15,
        width: Get.width / 1.10,
        decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(color: color ?? darkGreen),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
