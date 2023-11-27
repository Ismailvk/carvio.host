import 'dart:convert';
import 'package:get/get.dart';
import 'package:second_project/model/host_model.dart';
import 'package:second_project/model/vehicle_model.dart';
import 'package:second_project/service/api_service.dart';

class HostController extends GetxController {
  Rx<HostModel?> hostData = Rx<HostModel?>(null);
  RxList<VehicleModel> vehicleData = <VehicleModel>[].obs;
  RxList<VehicleModel> verifiedVehicle = <VehicleModel>[].obs;
  RxList<VehicleModel> pendingVehicle = <VehicleModel>[].obs;
  getHostDetails(String token) async {
    final hostDataResponse = await ApiService.instance.getHostDetails(token);
    final body = jsonDecode(hostDataResponse.body);
    if (body['message'] != 'Internal server error') {
      final hostModel = HostModel.fromJson(body);
      hostData.value = hostModel;
    } else {
      return null;
    }

    return body;
  }

  Future<void> getHostVehicles(String token) async {
    final response = await ApiService.instance.getHostVehicles(token);
    final List<dynamic> vehicleDetails = jsonDecode(response.body);
    print('a=== $vehicleDetails');
    vehicleData.assignAll(
        vehicleDetails.map((json) => VehicleModel.fromJson(json)).toList());
    pendingVehicle.assignAll(
        vehicleData.where((vehicle) => !vehicle.isVerified).toList());
    verifiedVehicle
        .assignAll(vehicleData.where((vehicle) => vehicle.isVerified).toList());
    update();
  }

  setHostData(hostData) {
    this.hostData = hostData;
    update();
  }
}
