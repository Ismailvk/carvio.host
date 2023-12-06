import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/view/login_page/login_page.dart';
import 'package:second_project/view_model/signup_controller.dart';
import 'package:second_project/widget/button_widget.dart';
import 'package:second_project/widget/texfield.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/image/whiteBackgroundImage.jpeg"),
                  fit: BoxFit.cover)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.hostFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                            child: Icon(
                          color: deepPurple,
                          Icons.person,
                          size: 35,
                        )),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Create an account",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 25),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Sign up to join",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 20),
                      MyTextField(
                        isSufix: false,
                        validator: (value) => controller.validateName(value!),
                        controller: controller.nameController,
                        hintText: 'Name',
                        obscureText: false,
                      ),
                      const SizedBox(height: 12),
                      MyTextField(
                        isSufix: false,
                        validator: (value) => controller.validateEmail(value!),
                        controller: controller.emailController,
                        hintText: 'Email',
                        obscureText: false,
                      ),
                      const SizedBox(height: 12),
                      MyTextField(
                        isSufix: false,
                        validator: (value) =>
                            controller.validatePhoneNumber(value!),
                        controller: controller.phonecontroller,
                        hintText: 'Mobile Number',
                        obscureText: false,
                        number: TextInputType.number,
                      ),
                      const SizedBox(height: 12),
                      MyTextField(
                        isSufix: true,
                        validator: (password) =>
                            controller.validPassword(password!),
                        controller: controller.passwordController,
                        hintText: 'Password',
                        obscureText: false,
                      ),
                      const SizedBox(height: 12),
                      MyTextField(
                        isSufix: true,
                        validator: (confirmPassword) =>
                            controller.validConfirmPassword(confirmPassword!),
                        controller: controller.confirmPasswordcontroller,
                        hintText: 'Conform Password',
                        obscureText: false,
                      ),
                      const SizedBox(height: 40),
                      ButtonWidget(
                          title: 'Sign up', onPress: () => controller.signUp()),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account?',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              Get.to(LoginScreen());
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: deepPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
