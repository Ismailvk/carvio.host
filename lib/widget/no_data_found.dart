import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NodataFoundWidget extends StatelessWidget {
  const NodataFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
        ),
        height: Get.height / 4,
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info),
              Text('\t No vehicle found'),
            ],
          ),
        ),
      ),
    );
  }
}
