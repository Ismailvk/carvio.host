import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/view_model/vehicle_controller.dart';
import 'package:second_project/widget/hind_text_widget.dart';

// ignore: must_be_immutable
class AppbarBckbutton extends StatelessWidget {
  String text;
  bool? isClear;
  AppbarBckbutton({super.key, required this.text, this.isClear});
  VehicleController controller = Get.put(VehicleController());

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(90),
      child: SafeArea(
        child: ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          leading: GestureDetector(
            onTap: () {
              Get.back();
              isClear == true ? controller.resetValues() : null;
            },
            child: Container(
              height: Get.height / 14,
              width: Get.width / 6.5,
              decoration: BoxDecoration(
                  color: appbarGrey,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            ),
          ),
          title: HindTextWidget(
              isBold: true,
              text: text,
              size: 20,
              color: black,
              left: 50,
              top: 0),
        ),
      ),
    );
  }
}
