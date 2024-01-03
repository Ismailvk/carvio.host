import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:second_project/service/api_service.dart';
import 'package:second_project/service/shared_preference.dart';
import 'package:second_project/utils/converting_string_to_file.dart';
import 'package:second_project/view/bottombar_screen/main_screen.dart';
import 'package:second_project/view_model/host_controller.dart';
import 'package:second_project/view_model/upload_image_screen_controller.dart';

class VehicleController extends GetxController {
  GlobalKey<FormState> addVehicleDetailsKey = GlobalKey<FormState>();
  GlobalKey<FormState> addVehiclePhotosKey = GlobalKey<FormState>();
  GlobalKey<FormState> addVehicleDocumentsKey = GlobalKey<FormState>();
  var currentStep = 0.obs;
  ScrollController scrollController = ScrollController();
  final int totalSteps = 2;
  // first page
  final TextEditingController nameController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  RxList<File> selectedImages = <File>[].obs;
  RxList<File> editFileImage = <File>[].obs;
  final TextEditingController fuelController = TextEditingController();
  final TextEditingController transmissionController = TextEditingController();
  Rx<File?> pickedImage = Rx<File?>(null);

  pickImage(CropAspectRatio cropAspectRatio) async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: image.path,
          aspectRatio: cropAspectRatio,
          compressQuality: 90,
          compressFormat: ImageCompressFormat.jpg);
      if (croppedFile == null) return null;
      pickedImage.value = File(croppedFile.path);
      selectedImages.add(pickedImage.value!);
      editFileImage.add(pickedImage.value!);
      print('images $selectedImages');
    }
  }

  addVehicle() async {
    if (addVehicleDetailsKey.currentState!.validate()) {
      currentStep.value = (currentStep.value + 1).clamp(0, 1);
      if (addVehiclePhotosKey.currentState!.validate()) {
        if (selectedImages.isNotEmpty) {
          currentStep.value = (currentStep.value + 1).clamp(0, 2);
          if (addVehicleDocumentsKey.currentState!.validate()) {
            UploadImageController uploadImageController =
                Get.put(UploadImageController());
            if (uploadImageController.selectedImage.value != null) {
              String fuel = fuelController.text;
              String transmission = transmissionController.text;
              final model = int.tryParse(modelController.text.trim());
              final price = int.tryParse(priceController.text.trim());
              final number = int.tryParse(numberController.text.trim());
              String name = nameController.text.trim();
              String brand = brandController.text.trim();
              String location = locationController.text.trim();
              File document = uploadImageController.selectedImage.value as File;
              final Map<String, dynamic> vehicledata = {
                'name': name,
                'brand': brand,
                'location': location,
                'number': number,
                'price': price,
                'model': model,
                'transmission': transmission,
                'fuel': fuel,
              };
              final response = await ApiService.instance
                  .addVehicle(vehicledata, selectedImages, document);
              try {
                if (response.statusCode == 200) {
                  // var responseBody = await response.stream.bytesToString();
                  HostController hostController = Get.put(HostController());
                  final token = SharedPreference.instance.getToke();
                  if (token == null) {
                    return;
                  }
                  await hostController.getHostVehicles(token);
                  Get.snackbar('Success', 'Vehicle added Successfully');
                  Get.offAll(const CoustomNavBar());
                } else {
                  Get.snackbar('Error', "Failed to upload images and details");
                }
              } catch (error) {
                print('Error uploading images and details: $error');
              }
            } else {
              Get.snackbar('Error', 'Plese add your Document');
            }
          }
        } else {
          Get.snackbar('Error', 'Plese add your image');
        }
      }
    }
  }

  deleteVehicle(String id, int index) async {
    final token = SharedPreference.instance.getToke();
    if (token == null) {
      Get.snackbar('Error', "You cant't delete vehicle");
      return;
    }
    try {
      final response = await ApiService.instance.deleteVehicle(id, token);
      if (response.statusCode == 200) {
        HostController controller = Get.put(HostController());
        controller.verifiedVehicle.removeAt(index);
        await ApiService.instance.getHostVehicles(token);
        Get.snackbar('Success', 'Successfully delete your vehicle');
        update();
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }

  deleteVehicleImage(String vehicleId, String imageId, int index) async {
    final token = SharedPreference.instance.getToke();
    if (token == null) {
      Get.snackbar('Error', "You cant't delete vehicle Image");
      return;
    }
    if (imageId.contains('image_cropper_')) {
      return;
    }
    String fileImage = convertFileListToOldFormat(selectedImages[index]);
    await ApiService.instance.deleteVehicleImages(vehicleId, fileImage, token);
  }

  editVehicle(String id) async {
    if (addVehicleDetailsKey.currentState!.validate()) {
      currentStep.value = (currentStep.value + 1).clamp(0, 1);
      if (addVehiclePhotosKey.currentState!.validate()) {
        if (selectedImages.isNotEmpty) {
          String fuel = fuelController.text;
          String transmission = transmissionController.text;
          final model = int.tryParse(modelController.text.trim());
          final price = int.tryParse(priceController.text.trim());
          String name = nameController.text.trim();
          String brand = brandController.text.trim();
          String location = locationController.text.trim();
          final Map<String, dynamic> editedVehicleData = {
            'name': name,
            'brand': brand,
            'location': location,
            'price': price,
            'model': model,
            'transmission': transmission,
            'fuel': fuel,
          };
          try {
            final response = await ApiService.instance
                .editVehicle(id, editedVehicleData, editFileImage);
            if (response.statusCode == 200) {
              HostController hostController = Get.put(HostController());
              final token = SharedPreference.instance.getToke();
              if (token == null) {
                return Get.snackbar('Error', "You can't edit vehicle");
              }
              await hostController.getHostVehicles(token);
              Get.snackbar('Success', 'Vehicle Edited Successfully');
              resetValues();
              Get.offAll(const CoustomNavBar());
            }
          } catch (e) {
            print('Error is $e');
          }
        } else {
          Get.snackbar('Error', "Please select your images");
        }
      }
    }
  }

  String? validation(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  void moveToNextStep() {
    currentStep.value = (currentStep.value + 1).clamp(0, totalSteps - 1);
  }

  void moveToPreviousStep() {
    currentStep.value = (currentStep.value - 1).clamp(0, 1);
  }

  void resetValues() {
    nameController.text = '';
    brandController.text = '';
    modelController.text = '';
    locationController.text = '';
    priceController.text = '';
    fuelController.text = '';
    transmissionController.text = '';
    // Clear the list
    selectedImages.clear();
    // Reset other relevant variables as needed
  }
}
