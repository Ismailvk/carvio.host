import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/resource/colors/colors.dart';

// ignore: must_be_immutable
class RichTexts extends StatelessWidget {
  void Function()? ontap;
  String one;
  String two;
  double left;
  RichTexts(
      {super.key,
      this.ontap,
      required this.one,
      required this.two,
      required this.left});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(left: left),
        child: RichText(
          text: TextSpan(
            text: one,
            style: GoogleFonts.hind(fontSize: 17),
            children: [
              TextSpan(
                  text: two,
                  style: GoogleFonts.hind(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: deepPurple))
            ],
          ),
        ),
      ),
    );
  }
}
