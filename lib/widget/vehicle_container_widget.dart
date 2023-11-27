import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/widget/hind_text_widget.dart';
import 'package:second_project/widget/popins_text_widget.dart';

class VehicleContainerWidget extends StatelessWidget {
  const VehicleContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 400,
        height: 180,
        decoration: BoxDecoration(
            color: white,
            border: Border.all(color: black),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 9),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 150,
                  height: 140,
                  decoration: BoxDecoration(
                    color: white,
                    image: const DecorationImage(
                        image: AssetImage('lib/image/mustang.jpeg'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                width: 200,
                height: 175,
                color: white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PopinsTextWidget(
                        isBold: false,
                        text: 'Datsun',
                        size: 16,
                        color: black,
                        left: 4,
                        top: 2),
                    PopinsTextWidget(
                        isBold: true,
                        text: '\$200.00',
                        size: 18,
                        color: red,
                        left: 4,
                        top: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          'lib/image/petrol.svg',
                          height: 25,
                          width: 25,
                        ),
                        PopinsTextWidget(
                            isBold: false,
                            text: 'Petrol',
                            size: 13,
                            color: black,
                            left: 4,
                            top: 2),
                        SvgPicture.asset(
                          'lib/image/transmission.svg',
                          height: 25,
                          width: 25,
                        ),
                        PopinsTextWidget(
                            isBold: false,
                            text: 'Automatic',
                            size: 13,
                            color: black,
                            left: 4,
                            top: 2),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4, right: 5),
                          child: HindTextWidget(
                              isBold: false,
                              text: 'Booking: 10',
                              size: 14,
                              color: black,
                              left: 4,
                              top: 5),
                        ),
                        HindTextWidget(
                            isBold: false,
                            text: 'Amount : 10000',
                            size: 14,
                            color: black,
                            left: 4,
                            top: 5),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor: Colors.orange),
                            child: const Text('Edit'),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: const Text('Delete'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
