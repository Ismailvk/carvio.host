import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/widget/gridview_container_widget.dart';
import 'package:second_project/widget/hind_text_widget.dart';
import 'package:second_project/widget/popins_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: HindTextWidget(
            isBold: true,
            text: 'Profile',
            size: 20,
            color: black,
            left: 10,
            top: 0),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GridviewContainerWidget(
                    value: '24,538',
                    title: 'Revenue Generated',
                  ),
                  GridviewContainerWidget(
                    value: '30',
                    title: 'Booking',
                  ),
                ],
              ),
              Row(
                children: [
                  GridviewContainerWidget(
                    value: '29',
                    title: 'Completed',
                  ),
                  GridviewContainerWidget(
                    value: '11',
                    title: 'Cancelled',
                  ),
                ],
              ),
              HindTextWidget(
                  isBold: true,
                  text: 'Trending',
                  size: 20,
                  color: black,
                  left: 10,
                  top: 10),
              const TrendigContainer()
            ],
          ),
        ),
      ),
    );
  }
}

class TrendigContainer extends StatelessWidget {
  const TrendigContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: Get.width / 1.04,
        height: Get.height / 5.4,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 9),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: Get.width / 2.65,
                  height: Get.height / 6.5,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('lib/image/mustang.jpeg'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            Container(
              width: Get.width / 2,
              height: 130,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PopinsTextWidget(
                      isBold: false,
                      text: 'Datsun',
                      size: 16,
                      color: Colors.black,
                      left: 4,
                      top: 2),
                  const PopinsTextWidget(
                      isBold: true,
                      text: '\$200.00',
                      size: 18,
                      color: Colors.red,
                      left: 4,
                      top: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        'lib/image/petrol.svg',
                        height: 25,
                        width: 25,
                      ),
                      const PopinsTextWidget(
                          isBold: false,
                          text: 'Petrol',
                          size: 13,
                          color: Colors.black,
                          left: 4,
                          top: 2),
                      SvgPicture.asset(
                        'lib/image/transmission.svg',
                        height: 25,
                        width: 25,
                      ),
                      const PopinsTextWidget(
                          isBold: false,
                          text: 'Automatic',
                          size: 13,
                          color: Colors.black,
                          left: 4,
                          top: 2),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HindTextWidget(
                          isBold: false,
                          text: 'Booking: 10',
                          size: 14,
                          color: Colors.black,
                          left: 4,
                          top: 5),
                      HindTextWidget(
                          isBold: false,
                          text: 'Amount : 10000',
                          size: 14,
                          color: Colors.black,
                          left: 4,
                          top: 5)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
