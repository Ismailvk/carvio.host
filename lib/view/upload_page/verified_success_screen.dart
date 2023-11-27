import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/resource/image_url/image_url.dart';
import 'package:second_project/view/home_screen/dashboard_screen.dart';
import 'package:second_project/widget/hind_text_widget.dart';
import 'package:second_project/widget/image_widget.dart';
import 'package:second_project/widget/popins_text_widget.dart';

class VerifiedSuccessScreen extends StatelessWidget {
  const VerifiedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: ImageWidget(
              opacity: false,
              image: carvioLight,
              height: 170,
              width: 240,
            ),
          ),
          HindTextWidget(
              isBold: true,
              text: 'Verified Successflully !!!',
              size: 26,
              color: black,
              left: 30,
              top: 20),
          PopinsTextWidget(
              isBold: false,
              text: 'Verified Account',
              size: 16,
              color: black,
              left: 30,
              top: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: ImageWidget(
                opacity: false,
                image: 'lib/image/thumb2.png',
                height: 200,
                width: 294),
          ),
          HindTextWidget(
              isBold: true,
              text:
                  ''' Your documents and details have uploaded successfully          you will get access once we verified your details''',
              size: 14,
              color: black,
              left: 12,
              top: 20),
          const SizedBox(height: 60),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Get.to(const HomeScreen());
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: const Color(0xff9E87E3),
              ),
              child: Text(
                'Done',
                style: TextStyle(color: white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
