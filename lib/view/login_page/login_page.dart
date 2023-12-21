import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/view/forget_password/forget_password_screen.dart';
import 'package:second_project/view/login_page/sign_up.dart';
import 'package:second_project/view_model/login_controller.dart';
import 'package:second_project/widget/button_widget.dart';
import 'package:second_project/widget/texfield.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                  key: controller.hostLoginKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            Icons.person,
                            color: deepPurple,
                            size: 35,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          const Text(
                            'Welcome back to',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            ' CARVIO.',
                            style: GoogleFonts.poppins(
                                color: grey,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'You\'ve been missed!',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // email textfield
                      MyTextField(
                        isSufix: false,
                        validator: (value) =>
                            controller.emailValidation(value!),
                        controller: controller.emailController,
                        hintText: 'Email',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      // password textfield
                      MyTextField(
                        isSufix: true,
                        validator: (value) =>
                            controller.passwordValidation(value!),
                        controller: controller.passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),

                      const SizedBox(height: 10),

                      // forgot password?
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => Get.to(ForgetPasswordScreen()),
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      // sign in button
                      ButtonWidget(
                        title: "Sign in ",
                        onPress: () => controller.loginHost(),
                      ),

                      const SizedBox(height: 50),

                      // or continue with

                      const SizedBox(height: 50),

                      // google + apple sign in buttons
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: const [
                      //     // google button
                      //     SquareTile(imagePath: 'lib/images/google.png'),

                      //     SizedBox(width: 25),

                      //     // apple button
                      //     SquareTile(imagePath: 'lib/images/apple.png')
                      //   ],
                      // ),

                      const SizedBox(height: 50),

                      // not a member? register now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not a member?',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () => Get.to(SignupScreen()),
                            child: Text(
                              'Register now',
                              style: TextStyle(
                                color: grey,
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
