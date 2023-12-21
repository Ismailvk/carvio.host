import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:second_project/model/host_model.dart';
import 'package:second_project/model/vehicle_model.dart';
import 'package:second_project/service/api_service.dart';
import 'package:second_project/service/shared_preference.dart';
import 'package:second_project/view/bottombar_screen/main_screen.dart';
import 'package:http/http.dart' as http;

class HostController extends GetxController {
  Rx<HostModel?> hostData = Rx<HostModel?>(null);
  RxList<VehicleModel> vehicleData = <VehicleModel>[].obs;
  RxList<VehicleModel> verifiedVehicle = <VehicleModel>[].obs;
  RxList<VehicleModel> pendingVehicle = <VehicleModel>[].obs;

  // Edit user dat
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> profileEditKey = GlobalKey<FormState>();
  Rx<File?> profileImage = Rx<File?>(null);

  // edit host password
  GlobalKey<FormState> changePasswordKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<http.Response> getHostDetails(String token) async {
    final hostDataResponse = await ApiService.instance.getHostDetails(token);
    final body = jsonDecode(hostDataResponse.body);
    if (body['message'] != 'Internal server error') {
      final hostModel = HostModel.fromJson(body);
      hostData.value = hostModel;
    }
    return hostDataResponse;
  }

  Future<void> getHostVehicles(String token) async {
    final response = await ApiService.instance.getHostVehicles(token);
    try {
      if (response.statusCode == 200) {
        final List<dynamic> vehicleDetails = jsonDecode(response.body);
        vehicleData.assignAll(
            vehicleDetails.map((json) => VehicleModel.fromJson(json)).toList());
        pendingVehicle.assignAll(
            vehicleData.where((vehicle) => !vehicle.isVerified).toList());
        verifiedVehicle.assignAll(
            vehicleData.where((vehicle) => vehicle.isVerified).toList());

        update();
      } else if (response.statusCode == 500) {
        final body = jsonDecode(response.body);
        Get.snackbar('Error', body['message']);
      } else {
        Get.snackbar('Error', 'Something Went Wrong');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something Went Wrong');
    }
  }

  setHostData(HostModel hostData) {
    this.hostData = hostData.obs;
    update();
  }

  editValidation(String value) {
    // ignore: unnecessary_null_comparison
    if (value.isEmpty || value == null) {
      Get.snackbar('Error', "Please fill all field");
      return '';
    }
    return null;
  }

  Future editHostData() async {
    if (profileEditKey.currentState!.validate()) {
      if (profileImage.value != null) {
        File profilePicture = profileImage.value as File;
        await ApiService.instance.profileUpdate(profilePicture);
      }
      final phone = int.tryParse(phoneController.text.trim());
      Map<String, dynamic> hostData = {
        "name": nameController.text,
        "phone": phone,
      };
      final token = SharedPreference.instance.getToke();
      if (token == null) {
        return Get.snackbar('Error', "Something Went Wrong");
      }
      final response = await ApiService.instance.editHosData(hostData, token);
      final body = jsonDecode(response.body);
      if (response.statusCode == 200 && body['message'] == "Success") {
        await getHostDetails(token);
        update();
        Get.offAll(const CoustomNavBar());
      } else {
        Get.snackbar('Error', '${body['message']}');
      }
    }
  }

  void pickImage(CropAspectRatio cropAspectRatio) async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedImage.path,
          aspectRatio: cropAspectRatio,
          compressQuality: 90,
          compressFormat: ImageCompressFormat.jpg);
      if (croppedFile == null) return null;
      profileImage.value = File(croppedFile.path);
    }
  }

  Future<void> changePassword() async {
    if (changePasswordKey.currentState!.validate()) {
      final token = SharedPreference.instance.getToke();
      if (token == null) {
        return;
      }
      final changedPassword = {
        "oldPass": oldPasswordController.text,
        "password": newPasswordController.text,
        "confirmPass": confirmPasswordController.text,
      };
      final response =
          await ApiService.instance.changePassword(token, changedPassword);
      try {
        final responseBody = jsonDecode(response.body);
        if (response.statusCode == 200 &&
            responseBody['message'] == "Success") {
          Get.snackbar('Success', "Your password Successfully changed");
          Get.offAll(const CoustomNavBar());
        } else if (response.statusCode == 403) {
          Get.snackbar("Error", "${responseBody['message']}");
        } else if (response.statusCode == 400) {
          Get.snackbar("Error", "${responseBody['message']}");
        }
      } catch (e) {
        Get.snackbar("Error", "$e");
      }
    }
  }

  String? validConfirmPassword(String confirmPassword) {
    if (newPasswordController.text != confirmPasswordController.text) {
      return 'Password does not match';
    }
    return null;
  }

  String? validPassword(String password) {
    if (password.length < 6) {
      return 'Must be more than 6 charater';
    } else if (password.isEmpty) {
      return 'Password is required';
    }
    return null;
  }
}
