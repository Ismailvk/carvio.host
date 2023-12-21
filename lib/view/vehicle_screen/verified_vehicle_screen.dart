import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:second_project/model/vehicle_model.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/service/api_url.dart';
import 'package:second_project/view/vehicle_screen/edit_vehicle.dart';
import 'package:second_project/view_model/host_controller.dart';
import 'package:second_project/view_model/vehicle_controller.dart';
import 'package:second_project/widget/alert_box.dart';
import 'package:second_project/widget/hind_text_widget.dart';
import 'package:second_project/widget/popins_text_widget.dart';

// ignore: must_be_immutable
class VerifiedVehicle extends StatelessWidget {
  VerifiedVehicle({super.key});

  HostController hostController = Get.put(HostController());
  VehicleController vehicleController = Get.put(VehicleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => hostController.verifiedVehicle.isNotEmpty
          ? ListView.builder(
              itemCount: hostController.verifiedVehicle.length,
              itemBuilder: (context, index) {
                VehicleModel vehicleData =
                    hostController.verifiedVehicle[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 400,
                    height: 180,
                    decoration: BoxDecoration(
                      color: white,
                      border: Border.all(color: black),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
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
                                items: vehicleData.images
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                PopinsTextWidget(
                                  isBold: false,
                                  text: vehicleData.name,
                                  size: 16,
                                  color: black,
                                  left: 4,
                                  top: 2,
                                ),
                                PopinsTextWidget(
                                  isBold: true,
                                  text: '\$${vehicleData.price}',
                                  size: 18,
                                  color: red,
                                  left: 4,
                                  top: 5,
                                ),
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
                                      text: vehicleData.fuel,
                                      size: 13,
                                      color: black,
                                      left: 4,
                                      top: 2,
                                    ),
                                    SvgPicture.asset(
                                      'lib/image/transmission.svg',
                                      height: 25,
                                      width: 25,
                                    ),
                                    PopinsTextWidget(
                                      isBold: false,
                                      text: vehicleData.transmission,
                                      size: 13,
                                      color: black,
                                      left: 4,
                                      top: 2,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4, right: 5),
                                      child: HindTextWidget(
                                        isBold: false,
                                        text: 'Booking: 10',
                                        size: 14,
                                        color: black,
                                        left: 4,
                                        top: 5,
                                      ),
                                    ),
                                    HindTextWidget(
                                      isBold: false,
                                      text: 'Amount : 10000',
                                      size: 14,
                                      color: black,
                                      left: 4,
                                      top: 5,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Get.to(EditVehicleScreen(
                                              vehicleData: vehicleData));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          backgroundColor: Colors.orange,
                                        ),
                                        child: const Text('Edit'),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () => AlertBox()
                                          .deleteAlert(vehicleData.id, index),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
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
              },
            )
          : const Center(child: Text('No vehicle found'))),
    );
  }
}
