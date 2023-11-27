import 'package:flutter/material.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/widget/appbar_backbutton_widget.dart';
import 'package:second_project/widget/button_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppbarBckbutton(text: 'Change Password'),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              style: TextStyle(color: grey),
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: darkGreen),
                  label: const Text('Old Password :')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              style: TextStyle(color: grey),
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: darkGreen),
                  label: const Text('New Password :')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              style: TextStyle(color: grey),
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: darkGreen),
                  label: const Text('Confirm Password :')),
            ),
          ),
          const Spacer(),
          ButtonWidget(title: 'Save Changes'),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
