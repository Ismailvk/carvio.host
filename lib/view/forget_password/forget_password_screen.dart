import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/resource/font/app_font.dart';
import 'package:second_project/view/login_page/login_page.dart';
import 'package:second_project/view_model/forget_password_controller.dart';
import 'package:second_project/widget/button_widget.dart';
import 'package:second_project/widget/texfield.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  ForgetPassword forgetController = Get.put(ForgetPassword());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Lottie.asset('lib/image/forgetPassword.json'),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Forget Password', style: AppFonts.sansitaFont),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text('Enter your registered email below',
                  style: AppFonts.popins),
            ),
            const SizedBox(height: 50),
            Form(
              key: forgetController.forgetPassKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MyTextField(
                    isSufix: false,
                    validator: (value) => forgetController.isEmail(value),
                    controller: forgetController.emailController,
                    hintText: 'Email',
                    obscureText: false),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: GestureDetector(
                  onTap: () => Get.to(LoginScreen()),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Remember your password ? ',
                            style: AppFonts.popins),
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height / 5),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonWidget(
                    title: 'Submit',
                    onPress: () => forgetController.forgetPassword()))
          ],
        ),
      ),
    );
  }
}
