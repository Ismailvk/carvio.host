import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:second_project/model/vehicle_model.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/service/api_url.dart';
import 'package:second_project/view_model/host_controller.dart';
import 'package:second_project/widget/popins_text_widget.dart';

// ignore: must_be_immutable
class PendingCarsScreen extends StatelessWidget {
  PendingCarsScreen({super.key});

  HostController hostController = Get.put(HostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => hostController.pendingVehicle.isNotEmpty
            ? ListView.builder(
                itemCount: hostController.pendingVehicle.length,
                itemBuilder: (context, index) {
                  VehicleModel vehicleDetails =
                      hostController.pendingVehicle[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: Get.width / 1,
                      height: Get.height / 6,
                      decoration: BoxDecoration(
                          color: white,
                          border: Border.all(color: black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 9),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 150,
                                height: 140,
                                child: CarouselSlider(
                                  items: vehicleDetails.images
                                      .map((e) =>
                                          Image.network('${Urls.baseUrl}/$e'))
                                      .toList(),
                                  options: CarouselOptions(
                                    aspectRatio: 16 / 9,
                                    viewportFraction: 0.8,
                                    enableInfiniteScroll: true,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                  ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  PopinsTextWidget(
                                      isBold: false,
                                      text: vehicleDetails.name,
                                      size: 16,
                                      color: black,
                                      left: 4,
                                      top: 2),
                                  PopinsTextWidget(
                                      isBold: true,
                                      text: '\$${vehicleDetails.price}',
                                      size: 18,
                                      color: red,
                                      left: 4,
                                      top: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset(
                                        'lib/image/petrol.svg',
                                        height: 25,
                                        width: 25,
                                      ),
                                      PopinsTextWidget(
                                          isBold: false,
                                          text: vehicleDetails.fuel,
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
                                          text: vehicleDetails.transmission,
                                          size: 13,
                                          color: black,
                                          left: 4,
                                          top: 2),
                                    ],
                                  ),
                                  PopinsTextWidget(
                                      isBold: false,
                                      text: 'Model : ${vehicleDetails.model}',
                                      size: 13,
                                      color: black,
                                      left: 4,
                                      top: 2),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: Text('No vehicle found'),
              ),
      ),
    );
  }
}
