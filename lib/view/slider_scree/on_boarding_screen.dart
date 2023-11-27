import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/view_model/on_boarding_controller.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/view/slider_scree/slider_page.dart';
import 'package:second_project/view/slider_scree/slider_page2.dart';
import 'package:second_project/view/slider_scree/slider_page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final OnBoardingController controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: const [
              SliderPage(),
              SliderPage2(),
              SliderPage3(),
            ],
          ),
          Positioned(
            child: Container(
              alignment: const Alignment(0, 0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(() {
                    return !controller.isLastPage.value
                        ? GestureDetector(
                            onTap: controller.skip,
                            child: Text('Skip', style: TextStyle(color: white)))
                        : const SizedBox();
                  }),
                  SmoothPageIndicator(
                      controller: controller.pageController, count: 3),
                  Obx(() {
                    return controller.isLastPage.value
                        ? GestureDetector(
                            onTap: controller.next,
                            child: Text('done', style: TextStyle(color: white)))
                        : GestureDetector(
                            onTap: controller.next,
                            child:
                                Text('Next', style: TextStyle(color: white)));
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
