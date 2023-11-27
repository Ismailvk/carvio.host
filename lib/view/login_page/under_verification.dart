import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/widget/button_widget.dart';
import 'package:second_project/widget/popins_text_widget.dart';

class UnderVerificationScreen extends StatefulWidget {
  const UnderVerificationScreen({super.key});

  @override
  State<UnderVerificationScreen> createState() =>
      _UnderVerificationScreenState();
}

class _UnderVerificationScreenState extends State<UnderVerificationScreen> {
  bool isvislible = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('lib/image/BQEfadvWM1.json',
                  height: 300, width: 400),
              PopinsTextWidget(
                  isBold: true,
                  text: 'Verifying Your Account !!!',
                  size: 20,
                  color: black,
                  left: 10,
                  top: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PopinsTextWidget(
                  isBold: false,
                  text:
                      'Your Account is under verification process. please wait for your verifiction mail',
                  size: 16,
                  color: grey,
                  left: 15,
                  top: 5,
                ),
              ),
              const SizedBox(height: 30),
              Visibility(
                visible: isvislible,
                child: ButtonWidget(title: 'Login your Account'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
