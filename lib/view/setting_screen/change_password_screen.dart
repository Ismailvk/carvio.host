import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/view_model/host_controller.dart';
import 'package:second_project/widget/appbar_backbutton_widget.dart';
import 'package:second_project/widget/button_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final HostController hostController = Get.put(HostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: hostController.changePasswordKey,
        child: Column(
          children: [
            AppbarBckbutton(text: 'Change Password'),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                controller: hostController.oldPasswordController,
                validator: (value) => hostController.validPassword(value!),
                style: TextStyle(color: grey),
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: darkGreen),
                    label: const Text('Old Password :')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                controller: hostController.newPasswordController,
                validator: (value) => hostController.validPassword(value!),
                style: TextStyle(color: grey),
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: darkGreen),
                    label: const Text('New Password :')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                controller: hostController.confirmPasswordController,
                validator: (value) =>
                    hostController.validConfirmPassword(value!),
                style: TextStyle(color: grey),
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: darkGreen),
                    label: const Text('Confirm Password :')),
              ),
            ),
            const Spacer(),
            ButtonWidget(
              title: 'Save Changes',
              onPress: () => hostController.changePassword(),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
