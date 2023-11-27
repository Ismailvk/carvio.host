import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/view_model/host_controller.dart';
import 'package:second_project/widget/appbar_backbutton_widget.dart';

// ignore: must_be_immutable
class MyprofileScreen extends StatelessWidget {
  MyprofileScreen({super.key});
  HostController hostController = Get.put(HostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppbarBckbutton(text: 'My Profile'),
          const SizedBox(height: 30),
          CircleAvatar(
            radius: 60,
            backgroundColor: red,
            backgroundImage: const AssetImage('lib/image/bmw.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              readOnly: true,
              controller: TextEditingController(
                  text: hostController.hostData.value!.name.toUpperCase()),
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
              readOnly: true,
              controller: TextEditingController(
                  text: hostController.hostData.value!.email),
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
              readOnly: true,
              controller: TextEditingController(
                  text:
                      "+91 ${hostController.hostData.value!.phone.toString()}"),
              style: TextStyle(color: grey),
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: darkGreen),
                  label: const Text('Phone Number :')),
            ),
          )
        ],
      ),
    );
  }
}
