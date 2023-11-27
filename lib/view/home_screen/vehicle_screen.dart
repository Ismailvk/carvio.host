import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/view/vehicle_screen/add_vehicle_screeen.dart';
import 'package:second_project/view/vehicle_screen/pending_cars.dart';
import 'package:second_project/view/vehicle_screen/verified_vehicle_screen.dart';
import 'package:second_project/widget/hind_text_widget.dart';

class VehicleScreen extends StatelessWidget {
  const VehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () => Get.to(AddVehicelScreen()),
              child: Icon(
                Icons.add,
                color: black,
                size: 35,
              ),
            ),
          )
        ],
        elevation: 0.0,
        title: HindTextWidget(
          isBold: true,
          text: 'Vehicle',
          size: 20,
          color: black,
          left: 10,
          top: 0,
        ),
      ),
      body: ContainedTabBarView(
        tabBarViewProperties: const TabBarViewProperties(
          physics: AlwaysScrollableScrollPhysics(),
        ),
        tabBarProperties: TabBarProperties(
          indicatorWeight: 4,
          indicatorColor: deepPurple,
          unselectedLabelColor: Colors.black.withOpacity(0.8),
          labelColor: Colors.black,
        ),
        tabs: const [
          Text('Verified'),
          Text('Pending'),
        ],
        views: [
          VerifiedVehicle(),
          PendingCarsScreen(),
        ],
        onChange: (index) {},
      ),
    );
  }
}
