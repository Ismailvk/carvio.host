import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/resource/colors/colors.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool isSufix;
  TextInputType? number;
  final FormFieldValidator<String?>? validator;

  MyTextField({
    super.key,
    this.number,
    required this.isSufix,
    required this.validator,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });
  RxBool obscuretext = true.obs;

  @override
  Widget build(BuildContext context) {
    if (isSufix == false) {
      obscuretext.value = false;
    }
    return Container(
      constraints: const BoxConstraints(
        minWidth: 100,
      ),
      child: Obx(() {
        return TextFormField(
          validator: validator,
          keyboardType: number ?? TextInputType.text,
          controller: controller,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              suffixIcon: isSufix
                  ? GestureDetector(
                      onTap: () {
                        obscuretext.value = !obscuretext.value;
                      },
                      child: Icon(
                        obscuretext.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: black,
                      ),
                    )
                  : const SizedBox(),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 5, color: red)),
              label: Text(hintText, style: TextStyle(color: black)),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[500])),
          obscureText: obscuretext.value,
        );
      }),
    );
  }
}
