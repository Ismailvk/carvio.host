import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/service/api_url.dart';
import 'package:second_project/view_model/host_controller.dart';
import 'package:second_project/widget/appbar_backbutton_widget.dart';
import 'package:second_project/widget/button_widget.dart';

// ignore: must_be_immutable
class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  HostController hostController = Get.put(HostController());

  @override
  void initState() {
    super.initState();
    if (mounted) {
      hostController.nameController.text = hostController.hostData.value!.name;
      hostController.phoneController.text =
          hostController.hostData.value!.phone.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Form(
            key: hostController.profileEditKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppbarBckbutton(text: 'Profile Settings'),
                const SizedBox(height: 30),
                Obx(() {
                  final profileImage =
                      hostController.hostData.value!.profilePicture;
                  return Stack(
                    children: [
                      profileImage != null
                          ? SizedBox(
                              width: Get.width / 3.5,
                              height: Get.height / 7,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: hostController.profileImage.value != null
                                    ? CircleAvatar(
                                        backgroundImage: FileImage(File(
                                            hostController
                                                .profileImage.value!.path)),
                                        // radius: 80,
                                      )
                                    : Image.network(
                                        '${Urls.baseUrl}/$profileImage',
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            )
                          : CircleAvatar(
                              radius: 60,
                              backgroundColor: red,
                              backgroundImage:
                                  const AssetImage('lib/image/user.png'),
                            ),
                      Positioned(
                        bottom: -2,
                        right: -20,
                        child: RawMaterialButton(
                          onPressed: () {
                            hostController.pickImage(
                                const CropAspectRatio(ratioX: 16, ratioY: 16));
                          },
                          elevation: 2.0,
                          fillColor: const Color(0xFFF5F6F9),
                          padding: const EdgeInsets.all(9),
                          shape: const CircleBorder(),
                          child: const Icon(Icons.camera_alt_outlined,
                              color: Colors.blue),
                        ),
                      )
                    ],
                  );
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    validator: (value) => hostController.editValidation(value!),
                    controller: hostController.nameController,
                    style: TextStyle(color: grey),
                    decoration: InputDecoration(
                        labelStyle: TextStyle(color: darkGreen),
                        label: const Text('Full Name :')),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    validator: (value) => hostController.editValidation(value!),
                    controller: hostController.phoneController,
                    style: TextStyle(color: grey),
                    decoration: InputDecoration(
                        labelStyle: TextStyle(color: darkGreen),
                        label: const Text('Phone Number :')),
                  ),
                ),
                const Spacer(),
                ButtonWidget(
                  title: 'Save Changes',
                  onPress: () => hostController.editHostData(),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
