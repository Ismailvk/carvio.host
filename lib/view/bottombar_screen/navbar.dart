import 'package:flutter/material.dart';
import 'package:second_project/resource/colors/colors.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) ontap;
  const NavBar({super.key, required this.pageIndex, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: deepPurple,
        ),
        height: 60,
        child: Row(
          children: [
            navItem(Icons.home, pageIndex == 0, ontap: () => ontap(0)),
            navItem(Icons.directions_car, pageIndex == 1,
                ontap: () => ontap(1)),
            navItem(Icons.person, pageIndex == 2, ontap: () => ontap(2)),
          ],
        ),
      ),
    );
  }

  Widget navItem(IconData icon, bool selected, {Function()? ontap}) {
    return Expanded(
        child: InkWell(
      onTap: ontap,
      child: Icon(icon,
          color: selected ? Colors.white : Colors.white.withOpacity(0.4)),
    ));
  }
}
