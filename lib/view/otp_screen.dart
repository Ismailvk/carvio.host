import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/view_model/signup_controller.dart';
import 'package:second_project/widget/button_widget.dart';
import 'package:second_project/widget/otp_textfield.dart';

// ignore: must_be_immutable
class SignupOtpScreen extends StatelessWidget {
  SignupOtpScreen({super.key, required this.email});
  final String email;
  SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: deepPurple),
        ),
        backgroundColor: Colors.white,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/image/whiteBackgroundImage.jpeg"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Stack(
              children: [
                Positioned(
                  child: Stack(
                    children: [
                      Positioned(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: MediaQuery.sizeOf(context).height / 6),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: deepPurple,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Icon(
                                  color: white,
                                  Icons.person,
                                  size: 35,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "one time password  shared to this \nemail address.",
                              style: GoogleFonts.poppins(
                                  color: Colors.black, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "($email)",
                              style: GoogleFonts.poppins(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 40),
                            Material(
                              color: Colors.transparent,
                              child: Form(
                                key: controller.otpFormkey,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    OtpTexfield(
                                        controller: controller.pin1,
                                        validator: (otp) =>
                                            controller.validOtp(otp!)),
                                    OtpTexfield(
                                        controller: controller.pin2,
                                        validator: (otp) =>
                                            controller.validOtp(otp!)),
                                    OtpTexfield(
                                        controller: controller.pin3,
                                        validator: (otp) =>
                                            controller.validOtp(otp!)),
                                    OtpTexfield(
                                        controller: controller.pin4,
                                        validator: (otp) =>
                                            controller.validOtp(otp!)),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            ButtonWidget(
                                onPress: () => controller.otpVerification(),
                                title: "Submit"),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
