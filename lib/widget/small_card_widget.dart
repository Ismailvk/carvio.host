import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SmallCarCardWidget extends StatelessWidget {
  final String name;
  final String asset;
  const SmallCarCardWidget(
      {super.key, required this.name, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade400,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 11,
        width: MediaQuery.of(context).size.width / 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              asset,
              height: 35,
              width: 35,
              color: Colors.black,
            ),
            Text(name)
          ],
        ),
      ),
    );
  }
}
