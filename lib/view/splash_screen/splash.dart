import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/model/host_model.dart';
import 'package:second_project/service/shared_preference.dart';
import 'package:second_project/view/bottombar_screen/main_screen.dart';
import 'package:second_project/view/login_page/login_page.dart';
import 'package:second_project/view_model/host_controller.dart';
import 'package:second_project/view_model/login_controller.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LoginController controller = Get.put(LoginController());
  HostController hostController = Get.put(HostController());
  @override
  void initState() {
    logincheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Carvio'),
      ),
    );
  }

  logincheck() async {
    await Future.delayed(const Duration(seconds: 2));
    final token = SharedPreference.instance.getToke();
    print('token is $token');
    if (token != null) {
      final data = await hostController.getHostDetails(token);
      print(data.statusCode);
      if (data.statusCode == 200) {
        final body = jsonDecode(data.body);
        if (body != null) {
          await hostController.getHostVehicles(token);
          final hostData = HostModel.fromJson(body);
          hostController.hostData.value = hostData;
          Get.to(const CoustomNavBar());
        } else {
          Get.to(LoginScreen());
          Get.snackbar('Error', 'Plese login your account');
        }
      } else {
        Get.to(LoginScreen());
      }
    } else {
      Get.to(LoginScreen());
    }
  }
}
