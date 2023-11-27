import 'package:flutter/material.dart';
import 'package:second_project/resource/colors/colors.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  String title;
  Function()? onPress;
  ButtonWidget({super.key, required this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xff9E87E3),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      height: 60,
      width: 375,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color(0xff9E87E3),
        ),
        child: Text(
          title,
          style: TextStyle(color: white),
        ),
      ),
    );
  }
}
