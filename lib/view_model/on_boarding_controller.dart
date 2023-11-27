import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  RxBool isLastPage = false.obs;
  PageController pageController = PageController();

  void onPageChanged(int value) {
    isLastPage.value = value == 2;
  }

  void skip() {
    pageController.jumpToPage(2);
  }

  void next() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
