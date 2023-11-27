import 'package:flutter/material.dart';
import 'package:second_project/view/bottombar_screen/nav_model.dart';
import 'package:second_project/view/bottombar_screen/navbar.dart';
import 'package:second_project/view/home_screen/dashboard_screen.dart';
import 'package:second_project/view/home_screen/profile_screen.dart';
import 'package:second_project/view/home_screen/vehicle_screen.dart';

class CoustomNavBar extends StatefulWidget {
  const CoustomNavBar({super.key});
  @override
  State<CoustomNavBar> createState() => _MainScreeeenState();
}

class _MainScreeeenState extends State<CoustomNavBar> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final carNavKey = GlobalKey<NavigatorState>();
  final headNavKey = GlobalKey<NavigatorState>();
  int selectTab = 0;
  List<NavModal> items = [];
  @override
  void initState() {
    items = [
      NavModal(page: const HomeScreen(), navKey: homeNavKey),
      NavModal(page: const VehicleScreen(), navKey: carNavKey),
      NavModal(page: ProfileScreen(), navKey: headNavKey),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (items[selectTab].navKey.currentState?.canPop() ?? false) {
          {
            items[selectTab].navKey.currentState?.pop();
            return Future.value(false);
          }
        } else {
          return Future.value(true);
        }
      },
      child: Stack(
        children: [
          Scaffold(
            // extendBody: true,
            body: IndexedStack(
              index: selectTab,
              children: items
                  .map((page) => Navigator(
                        key: page.navKey,
                        onGenerateInitialRoutes: (navigator, initialRoute) {
                          return [
                            MaterialPageRoute(builder: (context) => page.page)
                          ];
                        },
                      ))
                  .toList(),
            ),
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.endFloat,
            // floatingActionButton: selectTab == 1
            //     ? Container(
            //         margin: const EdgeInsets.only(bottom: 100),
            //         height: 64,
            //         width: 64,
            //         child: FloatingActionButton(
            //           shape: RoundedRectangleBorder(
            //               side: BorderSide(width: 3, color: deepPurple),
            //               borderRadius: BorderRadius.circular(100)),
            //           onPressed: () => Get.to(AddVehicle()),
            //           backgroundColor: Colors.white,
            //           elevation: 0,
            //           child: const Icon(Icons.add, color: Colors.black),
            //         ),
            //       )
            // : const SizedBox()
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: NavBar(
              pageIndex: selectTab,
              ontap: (index) {
                if (index == selectTab) {
                  items[index]
                      .navKey
                      .currentState
                      ?.popUntil((route) => route.isFirst);
                } else {
                  setState(() {
                    selectTab = index;
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
