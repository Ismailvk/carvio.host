import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageWidget extends StatelessWidget {
  String image;
  double height;
  double width;
  bool opacity;
  double? opacityValue;
  ImageWidget(
      {super.key,
      this.opacityValue,
      required this.opacity,
      required this.image,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: opacity == true ? opacityValue! : 1,
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
