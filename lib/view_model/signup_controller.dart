import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/model/host_model.dart';
import 'package:second_project/service/api_service.dart';
import 'package:second_project/service/shared_preference.dart';
import 'package:second_project/view/otp_screen.dart';
import 'package:second_project/view/slider_scree/on_boarding_screen.dart';
import 'package:second_project/view_model/host_controller.dart';

class SignUpController extends GetxController {
  HostController hostController = Get.put(HostController());
  // signup textfield
  GlobalKey<FormState> hostFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordcontroller = TextEditingController();

  // otp textfield
  GlobalKey<FormState> otpFormkey = GlobalKey<FormState>();
  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();

  signUp() async {
    if (hostFormKey.currentState!.validate()) {
      final phoneNumber = int.parse(phonecontroller.text.trim());
      final hostDetails = {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'phone': phoneNumber,
        'password': passwordController.text.trim(),
        'confirmPass': confirmPasswordcontroller.text.trim()
      };
      try {
        final response = await ApiService.instance.hostSignup(hostDetails);
        final body = jsonDecode(response.body);
        if (response.statusCode == 400) {
          return Get.snackbar('Error', body['message']);
        }
        Get.to(() => SignupOtpScreen(email: emailController.text));
      } catch (e) {
        print("error is $e");
      }
    }
  }

  otpVerification() async {
    if (otpFormkey.currentState!.validate()) {
      String otpfromHoster = '${pin1.text}${pin2.text}${pin3.text}${pin4.text}';
      final otp = int.tryParse(otpfromHoster);

      final otpDetails = {
        'otp': otp,
      };

      try {
        final response = await ApiService.instance.hostOtp(otpDetails);
        final body = jsonDecode(response.body);
        if (body['message'] == 'Success' && response.statusCode == 200) {
          String token = body['token'];
          await SharedPreference.instance.storeToken(token);
          final userData = await ApiService.instance.getHostDetails(token);
          final userDetails = jsonDecode(userData.body);
          if (userDetails != null) {
            final data = HostModel.fromJson(userDetails);
            await hostController.setHostData(data);
            await hostController.getHostVehicles(token);
            Get.offAll(const OnBoardingScreen());
            Get.snackbar('Success', 'Account Successfully Created');
          } else {
            Get.snackbar('Failed', 'Somthing Went Wrong');
          }
        }
      } catch (e) {}
    }
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    } else if (!GetUtils.isEmail(value)) {
      return 'Please Enter a Valid Email';
    }
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String? validatePhoneNumber(String value) {
    final RegExp pattern = RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$');
    if (!pattern.hasMatch(value)) {
      return 'Invalid mobile number';
    }

    return null;
  }

  String? validPassword(String password) {
    if (password.length < 8) {
      return 'Must be more than 8 charater';
    } else if (password.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  String? validConfirmPassword(String confirmPassword) {
    if (passwordController.text != confirmPasswordcontroller.text) {
      return 'Password does not match';
    }
    return null;
  }

  String? validOtp(String otp) {
    if (pin1.text.isEmpty &&
        pin2.text.isEmpty &&
        pin3.text.isEmpty &&
        pin4.text.isEmpty) {
      return '';
    }
    return null;
  }
}
