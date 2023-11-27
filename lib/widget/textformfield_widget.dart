import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/resource/colors/colors.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isSufix;
  final TextInputType? keybordtype;
  final FormFieldValidator<String?>? validator;
  CustomTextfield(
      {super.key,
      this.keybordtype,
      required this.validator,
      required this.hint,
      required this.isSufix,
      required this.controller});

  RxBool obscureText = true.obs;

  @override
  Widget build(BuildContext context) {
    if (isSufix == false) {
      obscureText.value = false;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: Get.height / 15,
        width: Get.width / 1,
        child: Obx(
          () {
            return TextFormField(
              validator: validator,
              controller: controller,
              textInputAction: TextInputAction.next,
              keyboardType: keybordtype,
              style: TextStyle(color: white),
              decoration: InputDecoration(
                isDense: true,
                constraints: const BoxConstraints(minHeight: 50, maxHeight: 70),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                suffixIcon: isSufix
                    ? GestureDetector(
                        onTap: () {
                          obscureText.value = !obscureText.value;
                        },
                        child: Icon(
                          obscureText.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: white,
                        ),
                      )
                    : const SizedBox(),
                border: const OutlineInputBorder(),
                fillColor: Colors.transparent,
                filled: true,
                errorBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: red)),
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: white)),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                hintText: hint,
                hintStyle: TextStyle(color: white),
              ),
              obscureText: obscureText.value,
            );
          },
        ),
      ),
    );
  }
}
