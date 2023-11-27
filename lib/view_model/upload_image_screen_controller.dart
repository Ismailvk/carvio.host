import 'dart:io';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageController extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null);
  Rx<double> percentage = 0.0.obs;

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
      selectedImage.value = File(croppedFile.path);
      increment();
    }
  }

  void clearImage() {
    selectedImage.value = null;
    percentage.value = 0.0;
  }

  // animated percentage indecator increment
  void increment() {
    percentage.value = 1;
  }
}
