import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:second_project/model/revenue_model.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/service/api_url.dart';
import 'package:second_project/view/home_screen/trnding_car.dart';
import 'package:second_project/view_model/dasboard_controller.dart';
import 'package:second_project/widget/gridview_container_widget.dart';
import 'package:second_project/widget/hind_text_widget.dart';
import 'package:second_project/widget/no_data_found.dart';
import 'package:second_project/widget/popins_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DashBoardController dashBoard = Get.put(DashBoardController());

  @override
  void initState() {
    super.initState();
    dashBoard.dashboardData();
  }

  @override
  Widget build(BuildContext context) {
    final data = dashBoard.dashBoardData;
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
              Obx(
                () => Row(
                  children: [
                    GridviewContainerWidget(
                      value: data.value?.hostRevenue.toString() ?? 0.toString(),
                      title: 'Revenue Generated',
                    ),
                    GridviewContainerWidget(
                      value: data.value?.bookedCount.toString() ?? 0.toString(),
                      title: 'Booking',
                    ),
                  ],
                ),
              ),
              Obx(() => Row(
                    children: [
                      GridviewContainerWidget(
                        value: data.value?.completedCount.toString() ??
                            0.toString(),
                        title: 'Completed',
                      ),
                      GridviewContainerWidget(
                        value: data.value?.cancelledBooking.toString() ??
                            0.toString(),
                        title: 'Cancelled',
                      ),
                    ],
                  )),
              HindTextWidget(
                  isBold: true,
                  text: 'Trending',
                  size: 20,
                  color: black,
                  left: 10,
                  top: 10),
              Obx(() => TrendigContainer(trending: data.value?.trending))
            ],
          ),
        ),
      ),
    );
  }
}

class TrendigContainer extends StatelessWidget {
  final Trending? trending;
  const TrendigContainer({super.key, this.trending});

  @override
  Widget build(BuildContext context) {
    if (trending == null) {
      return const NodataFoundWidget();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () => Get.to(TrendingCarDetails(trending: trending!)),
        child: Container(
          width: Get.width / 1.04,
          height: Get.height / 5.4,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: Get.width / 2.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(
                            '${Urls.baseUrl}/${trending!.images[0]}'),
                        fit: BoxFit.fill),
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
                    PopinsTextWidget(
                        isBold: false,
                        text:
                            "${trending!.brand.toUpperCase()} ${trending!.name.toUpperCase()}",
                        size: 16,
                        color: Colors.black,
                        left: 4,
                        top: 2),
                    PopinsTextWidget(
                        isBold: true,
                        text: '₹ ${trending?.price}',
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
                        PopinsTextWidget(
                            isBold: false,
                            text: trending!.fuel,
                            size: 13,
                            color: Colors.black,
                            left: 4,
                            top: 2),
                        SvgPicture.asset(
                          'lib/image/transmission.svg',
                          height: 25,
                          width: 25,
                        ),
                        PopinsTextWidget(
                            isBold: false,
                            text: trending!.transmission,
                            size: 13,
                            color: Colors.black,
                            left: 4,
                            top: 2),
                      ],
                    ),
                    HindTextWidget(
                        isBold: false,
                        text: 'Model: ${trending!.model.toString()}',
                        size: 14,
                        color: Colors.black,
                        left: 4,
                        top: 5)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
