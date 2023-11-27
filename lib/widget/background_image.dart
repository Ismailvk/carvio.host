import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackgroundImageWidget extends StatelessWidget {
  String image;
  bool isOpacity;
  double value;
  double? height;
  double? width;
  BackgroundImageWidget(
      {super.key,
      this.height,
      this.width,
      required this.image,
      required this.isOpacity,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
          colorFilter: isOpacity
              ? ColorFilter.mode(
                  Colors.black.withOpacity(value), BlendMode.dstATop)
              : ColorFilter.mode(
                  Colors.black.withOpacity(value), BlendMode.dstATop),
        ),
      ),
    );
  }
}
