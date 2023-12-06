import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_project/view_model/vehicle_controller.dart';

class AlertBox {
  VehicleController vehicleController = Get.put(VehicleController());
  deleteAlert(String id, int index) {
    Get.defaultDialog(
      title: 'Confirmation',
      middleText: 'Do you want to delete vehicle?',
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            vehicleController.deleteVehicle(id, index);
            Get.back(result: true);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
