import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/view/my_profile_screen/my_profile_screen.dart';
import 'package:second_project/view/setting_screen/settings_screen.dart';
import 'package:second_project/view_model/host_controller.dart';
import 'package:second_project/widget/hind_text_widget.dart';
import 'package:second_project/widget/image_widget.dart';
import 'package:second_project/widget/listile_widget.dart';
import 'package:second_project/widget/popins_text_widget.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  HostController hostController = Get.put(HostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: white,
          elevation: 0.0,
          title: HindTextWidget(
              isBold: true,
              text: 'Profile',
              size: 20,
              color: black,
              left: 10,
              top: 0)),
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Container(
                  height: Get.height / 4,
                  width: Get.width / 1.13,
                  decoration: BoxDecoration(
                      color: black, borderRadius: BorderRadius.circular(15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 70),
                child: ImageWidget(
                    opacityValue: 0.2,
                    opacity: true,
                    image: "lib/image/carvio.png",
                    height: Get.height / 12,
                    width: Get.width / 1.4),
              ),
              Positioned(
                top: Get.height / 15,
                left: Get.width / 2 - 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: white,
                      radius: 50,
                      child: const CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage('lib/image/mustang.jpeg'),
                      ),
                    ),
                    PopinsTextWidget(
                      isBold: false,
                      text: hostController.hostData.value!.name.toUpperCase(),
                      size: 16,
                      color: white,
                      left: 0,
                      top: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () => Get.to(MyprofileScreen()),
            child: const ListTileWidget(
                image: "lib/image/account.svg", title: 'My Profile'),
          ),
          const ListTileWidget(image: "lib/image/key.svg", title: 'Privacy'),
          const ListTileWidget(
              image: "lib/image/alert.svg", title: 'Help & Info'),
          InkWell(
            onTap: () => Get.to(const SettingsScreen()),
            child: const ListTileWidget(
                image: "lib/image/settings.svg", title: 'Settings'),
          )
        ],
      ),
    );
  }
}
