import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  String hint;
  bool isSufix;
  final FormFieldValidator<String?>? validator;
  TextEditingController controller;
  TextInputType? keybordtype;
  CustomTextfield({
    Key? key,
    this.keybordtype,
    required this.validator,
    required this.hint,
    required this.isSufix,
    required this.controller,
  });

  RxBool obscureText = true.obs;

  @override
  Widget build(BuildContext context) {
    if (isSufix == false) {
      obscureText.value = false;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: Get.height / 15,
        width: Get.width / 1,
        child: TextFormField(
          validator: validator,
          controller: controller,
          textInputAction: TextInputAction.next,
          keyboardType: keybordtype,
          style: GoogleFonts.poppins(color: Colors.black),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            fillColor: Colors.transparent,
            filled: true,
            label: Text(hint),
            labelStyle: GoogleFonts.poppins(color: Colors.black),
            errorBorder: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            hintText: hint,
            hintStyle: GoogleFonts.poppins(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
