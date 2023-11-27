import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/widget/hind_text_widget.dart';
import 'package:second_project/widget/popins_text_widget.dart';

// ignore: must_be_immutable
class GridviewContainerWidget extends StatelessWidget {
  String value;
  String title;
  GridviewContainerWidget(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width / 2.19,
        height: Get.height / 8,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 1, color: black)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HindTextWidget(
                isBold: true,
                text: value,
                size: 24,
                color: black,
                left: 15,
                top: 15),
            PopinsTextWidget(
                isBold: false,
                text: title,
                size: 15,
                color: grey,
                left: 15,
                top: 5)
          ],
        ),
      ),
    );
  }
}
