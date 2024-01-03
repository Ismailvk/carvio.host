import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/service/api_service.dart';

class ForgetPassword extends GetxController {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> forgetPassKey = GlobalKey<FormState>();

  forgetPassword() async {
    if (forgetPassKey.currentState!.validate()) {
      final String email = emailController.text.trim();
      final emailData = {'email': email};
      try {
        final response = await ApiService.instance.forgetPassword(emailData);
        if (response.statusCode == 200) {
          //
        }
      } catch (e) {
        Get.snackbar('Error', '$e');
      }
    }
  }

  String? isEmail(String? value) {
    final hasEmail = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (value == null || value.isEmpty) return 'Email is Required';
    return hasEmail.hasMatch(value) ? null : 'Invalid email';
  }
}
