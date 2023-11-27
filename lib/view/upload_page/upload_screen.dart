import 'package:advance_animated_progress_indicator/advance_animated_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/view_model/upload_image_screen_controller.dart';
import 'package:second_project/widget/popins_text_widget.dart';

// ignore: must_be_immutable
class UploadImageScreen extends StatelessWidget {
  UploadImageScreen({super.key});
  final UploadImageController controller = Get.put(UploadImageController());

  XFile? imagepath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopinsTextWidget(
            isBold: true,
            text: "Upload Document",
            size: 24,
            color: black,
            left: Get.width / 18,
            top: Get.height / 20),
        const SizedBox(height: 20),
        Obx(
          () {
            var selectedImage = controller.selectedImage.value;
            return GestureDetector(
              onTap: () async {
                controller
                    .pickImage(const CropAspectRatio(ratioX: 16, ratioY: 9));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Container(
                  width: Get.width / 1,
                  height: Get.height / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: RDottedLineBorder.all(
                        color: black, width: 2, dottedSpace: 3),
                  ),
                  child: selectedImage != null
                      ? Stack(
                          children: [
                            SizedBox(
                              width: Get.width / 1,
                              height: Get.height / 3.5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  selectedImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: InkWell(
                                onTap: controller.clearImage,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.deepPurple,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      : Icon(
                          Icons.upload,
                          size: 50,
                          color: black,
                        ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 30),
        Obx(
          () => Container(
            width: 320,
            margin: const EdgeInsets.only(top: 10, left: 20),
            child: AnimatedLinearProgressIndicator(
              indicatorColor: Colors.green,
              indicatorBackgroundColor: white,
              percentage: controller.percentage.toDouble(),
              animationDuration: const Duration(
                seconds: 1,
              ),
              label: 'Document',
            ),
          ),
        ),
      ],
    );
  }
}
