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

// class SignUpScreen extends StatelessWidget {
//   SignUpScreen({super.key});

//   SignUpController controller = Get.put(SignUpController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           BackgroundImageWidget(image: backMap, isOpacity: true, value: 0.9),
//           Positioned(
//             child: Stack(
//               children: [
//                 BackgroundImageWidget(
//                   image: rectangle,
//                   isOpacity: true,
//                   value: 0.62,
//                   height: MediaQuery.of(context).size.height * 1,
//                   width: MediaQuery.of(context).size.width * 1,
//                 ),
//                 SingleChildScrollView(
//                   child: Form(
//                     key: controller.hostFormKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         ImageWidget(
//                           opacity: false,
//                           image: carvioLight,
//                           height: MediaQuery.of(context).size.height * 0.2,
//                           width: MediaQuery.of(context).size.width * 0.6,
//                         ),
//                         HindTextWidget(
//                             isBold: true,
//                             text: 'Create New Account',
//                             size: 22,
//                             color: white,
//                             left: 0,
//                             top: 0),
//                         Padding(
//                           padding: const EdgeInsets.all(18),
//                           child: GlassmorphicContainer(
//                             width: MediaQuery.of(context).size.width * 1,
//                             height: MediaQuery.of(context).size.height * 0.6,
//                             borderRadius:
//                                 MediaQuery.of(context).size.width * 0.04,
//                             blur: 2,
//                             border: 0.5,
//                             linearGradient: LinearGradient(
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                               colors: [
//                                 Colors.white.withOpacity(0.2),
//                                 Colors.white.withOpacity(0.05),
//                               ],
//                             ),
//                             borderGradient: LinearGradient(
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                               colors: [
//                                 Colors.white.withOpacity(0.5),
//                                 Colors.white.withOpacity(0.5),
//                               ],
//                             ),
//                             child: Column(
//                               children: [
//                                 SizedBox(height: Get.height / 80),
//                                 CustomTextfield(
//                                     validator: (value) =>
//                                         controller.validateEmail(value!),
//                                     controller: controller.nameController,
//                                     hint: 'Enter Name',
//                                     isSufix: false),
//                                 CustomTextfield(
//                                     validator: (value) =>
//                                         controller.validatePhoneNumber(value!),
//                                     controller: controller.phonecontroller,
//                                     hint: 'Enter phone number',
//                                     isSufix: false),
//                                 CustomTextfield(
//                                     validator: (value) =>
//                                         controller.validateEmail(value!),
//                                     controller: controller.emailController,
//                                     hint: 'Enter Email',
//                                     isSufix: false),
//                                 CustomTextfield(
//                                     validator: (value) =>
//                                         controller.validPassword(value!),
//                                     controller: controller.passwordController,
//                                     hint: 'Enter password',
//                                     isSufix: true),
//                                 CustomTextfield(
//                                     validator: (value) =>
//                                         controller.validConfirmPassword(value!),
//                                     controller:
//                                         controller.confirmPasswordcontroller,
//                                     hint: 'Confirm password',
//                                     isSufix: true),
//                                 const SizedBox(height: 10),
//                                 ButtonWidget(
//                                   title: 'Sign in',
//                                   onPress: () {
//                                     print('object');
//                                     controller.signUp();
//                                   },
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     ImageWidget(
//                                         opacity: false,
//                                         image: google,
//                                         height: 40,
//                                         width: 40),
//                                     HindTextWidget(
//                                       isBold: false,
//                                       text: 'Login with google',
//                                       size: 16,
//                                       color: white,
//                                       left: 5,
//                                       top: 0,
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                         RichTexts(
//                           one: 'Already have an account?  ',
//                           two: 'Sign in',
//                           left: 0,
//                           ontap: () => Get.to(LoginScreen()),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }