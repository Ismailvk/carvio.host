import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:second_project/resource/colors/colors.dart';

class ListTileWidget extends StatelessWidget {
  final String image;
  final String title;
  const ListTileWidget({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 15),
      child: Container(
        height: Get.height / 15,
        width: Get.width / 1.14,
        decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: ListTile(
          leading: SvgPicture.asset(
            image,
            height: 30,
            width: 30,
          ),
          title: Text(title, textAlign: TextAlign.center),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
