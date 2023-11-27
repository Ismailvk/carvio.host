import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/widget/appbar_backbutton_widget.dart';
import 'package:second_project/widget/button_widget.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppbarBckbutton(text: 'Profile Settings'),
              const SizedBox(height: 30),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: red,
                    backgroundImage: const AssetImage('lib/image/bmw.png'),
                  ),
                  Positioned(
                    bottom: -2,
                    right: -20,
                    child: RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: const Color(0xFFF5F6F9),
                      padding: const EdgeInsets.all(9),
                      shape: const CircleBorder(),
                      child: const Icon(Icons.camera_alt_outlined,
                          color: Colors.blue),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(color: grey),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: darkGreen),
                      label: const Text('Full Name :')),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(color: grey),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: darkGreen),
                      label: const Text('Email :')),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(color: grey),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: darkGreen),
                      label: const Text('Phone Number :')),
                ),
              ),
              const Spacer(),
              ButtonWidget(title: 'Save Changes'),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
