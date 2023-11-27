import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/service/shared_preference.dart';
import 'package:second_project/view/login_page/login_page.dart';
import 'package:second_project/view/setting_screen/change_password_screen.dart';
import 'package:second_project/view/setting_screen/profile_settings.dart';
import 'package:second_project/widget/appbar_backbutton_widget.dart';
import 'package:second_project/widget/setting_listtile_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppbarBckbutton(text: 'Settings'),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => Get.to(ProfileSettings()),
            child: SettingsListTileWidget(title: 'Profile Settings'),
          ),
          GestureDetector(
            onTap: () => Get.to(const ChangePasswordScreen()),
            child: SettingsListTileWidget(title: 'Change Password'),
          ),
          GestureDetector(
            onTap: () => Get.defaultDialog(
              title: 'Log Out',
              content: const Text('Do you want to log out'),
              onCancel: () {
                Get.back();
              },
              buttonColor: deepPurple,
              onConfirm: () async {
                await SharedPreference.instance.removeToken();
                Get.offAll(LoginScreen());
              },
            ),
            child: SettingsListTileWidget(
              title: 'Logout',
              color: red,
            ),
          )
        ],
      ),
    );
  }
}
