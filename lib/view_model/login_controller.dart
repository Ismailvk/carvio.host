import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/model/host_model.dart';
import 'package:second_project/service/api_service.dart';
import 'package:second_project/service/shared_preference.dart';
import 'package:second_project/view/bottombar_screen/main_screen.dart';
import 'package:second_project/view/login_page/under_verification.dart';
import 'package:second_project/view_model/host_controller.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> hostLoginKey = GlobalKey<FormState>();
  HostController hostController = Get.put(HostController());

  loginHost() async {
    try {
      if (hostLoginKey.currentState!.validate()) {
        final String email = emailController.text.trim();
        final String password = passwordController.text.trim();
        Map<String, String> loginData = {
          'email': email,
          'password': password,
        };
        final response = await ApiService.instance.loginHost(loginData);
        final body = jsonDecode(response.body);
        if (response.statusCode == 400) {
          Get.snackbar('error', '${body['message']}');
          Get.to(const UnderVerificationScreen());
        } else if (response.statusCode == 404) {
          Get.snackbar('error', '${body['message']}');
        } else if (response.statusCode == 200 &&
            body['message'] == 'Logged Successfully') {
          final token = body['token'];
          SharedPreference.instance.storeToken(token);
          final userData = await ApiService.instance.getHostDetails(token);
          print('login user data $userData');
          final loginData = jsonDecode(userData.body);
          final data = HostModel.fromJson(loginData);
          hostController.setHostData(data);
          await hostController.getHostVehicles(token);
          Get.offAll(const CoustomNavBar());
          onClose();
        }
      }
    } catch (e) {
      Get.snackbar('Error', "Something went wrong");
    }
  }

  String? emailValidation(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? passwordValidation(String value) {
    if (value.isEmpty) {
      return 'Enter Password';
    } else if (value.length < 8) {
      return 'Must be more than 8 charater';
    }
    return null;
  }

  @override
  void onClose() {
    super.onClose();
    emailController.text = '';
    passwordController.text = '';
  }
}
