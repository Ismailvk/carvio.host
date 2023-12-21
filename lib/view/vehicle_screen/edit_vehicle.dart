import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:second_project/model/vehicle_model.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/utils/converting_string_to_file.dart';
import 'package:second_project/view/vehicle_screen/map_screen.dart';
import 'package:second_project/view_model/vehicle_controller.dart';
import 'package:second_project/widget/appbar_backbutton_widget.dart';
import 'package:second_project/widget/button_widget.dart';
import 'package:second_project/widget/drop_down_widget.dart';
import 'package:second_project/widget/hind_text_widget.dart';
import 'package:second_project/widget/texfield.dart';

// ignore: must_be_immutable
class EditVehicleScreen extends StatefulWidget {
  VehicleModel vehicleData;
  EditVehicleScreen({Key? key, required this.vehicleData}) : super(key: key);

  @override
  State<EditVehicleScreen> createState() => _EditVehicleScreenState();
}

class _EditVehicleScreenState extends State<EditVehicleScreen> {
  final VehicleController addVehicleController = Get.put(VehicleController());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      addVehicleController.nameController.text = widget.vehicleData.name;
      addVehicleController.brandController.text = widget.vehicleData.brand;
      addVehicleController.modelController.text =
          widget.vehicleData.model.toString();
      addVehicleController.locationController.text =
          widget.vehicleData.location;
      addVehicleController.priceController.text =
          widget.vehicleData.price.toString();
      addVehicleController.fuelController.text = widget.vehicleData.fuel;
      addVehicleController.transmissionController.text =
          widget.vehicleData.transmission;

      List<File> imageFiles =
          await convertingStringtoImage(widget.vehicleData.images);
      addVehicleController.selectedImages.value = imageFiles;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Column(
              children: [
                AppbarBckbutton(text: 'Edit vehicle details', isClear: true),
                Expanded(
                  child: Stepper(
                    controller: addVehicleController.scrollController,
                    currentStep: addVehicleController.currentStep.value,
                    elevation: 0,
                    connectorThickness: 2,
                    type: StepperType.horizontal,
                    controlsBuilder: (context, details) {
                      return Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: ButtonWidget(
                                  title:
                                      addVehicleController.currentStep.value ==
                                              0
                                          ? 'Continue'
                                          : 'Confirm',
                                  onPress: () {
                                    if (addVehicleController
                                            .currentStep.value ==
                                        addVehicleController.totalSteps - 1) {
                                      // Last step, handle confirmation
                                      addVehicleController
                                          .editVehicle(widget.vehicleData.id);
                                    } else {
                                      // Move to the next step
                                      addVehicleController.moveToNextStep();
                                    }
                                  }),
                            ),
                            const SizedBox(width: 10),
                            if (addVehicleController.currentStep != 0.obs)
                              Expanded(
                                child: ButtonWidget(
                                  title: 'Back',
                                  onPress: () =>
                                      addVehicleController.moveToPreviousStep(),
                                ),
                              )
                          ],
                        ),
                      );
                    },
                    steps: [
                      Step(
                        state: addVehicleController.currentStep.value > 0
                            ? StepState.complete
                            : StepState.indexed,
                        isActive: addVehicleController.currentStep.value == 0,
                        title: const Text('Details'),
                        content: Form(
                          key: addVehicleController.addVehicleDetailsKey,
                          child: Column(
                            children: [
                              MyTextField(
                                isSufix: false,
                                validator: (value) =>
                                    addVehicleController.validation(value!),
                                controller: addVehicleController.nameController,
                                hintText: 'Name',
                                obscureText: false,
                              ),
                              const SizedBox(height: 10),
                              MyTextField(
                                isSufix: false,
                                validator: (value) =>
                                    addVehicleController.validation(value!),
                                controller:
                                    addVehicleController.brandController,
                                hintText: 'Brand',
                                obscureText: false,
                              ),
                              const SizedBox(height: 10),
                              MyTextField(
                                isSufix: false,
                                validator: (value) =>
                                    addVehicleController.validation(value!),
                                controller:
                                    addVehicleController.modelController,
                                hintText: 'Model',
                                obscureText: false,
                                number: TextInputType.number,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: MyTextField(
                                      isSufix: false,
                                      validator: (value) => addVehicleController
                                          .validation(value!),
                                      controller: addVehicleController
                                          .locationController,
                                      hintText: 'Location',
                                      obscureText: false,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      Get.to(VehicleAddMapScreen());
                                    },
                                    child: Container(
                                      width: Get.width / 5.6,
                                      height: Get.height / 13,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: appbarGrey),
                                        color: lightGrey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        Icons.location_on,
                                        color: deepPurple,
                                        size: 33,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              MyTextField(
                                isSufix: false,
                                validator: (value) =>
                                    addVehicleController.validation(value!),
                                controller:
                                    addVehicleController.priceController,
                                hintText: 'Price',
                                obscureText: false,
                                number: TextInputType.number,
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                      Step(
                          state: addVehicleController.currentStep.value > 1
                              ? StepState.complete
                              : StepState.indexed,
                          isActive: addVehicleController.currentStep.value == 1,
                          title: const Text('Document'),
                          content: Obx(
                            () => SingleChildScrollView(
                              child: Form(
                                key: addVehicleController.addVehiclePhotosKey,
                                child: Column(
                                  children: [
                                    DropDownWid(
                                        fuel: true,
                                        controller: addVehicleController
                                            .fuelController),
                                    DropDownWid(
                                        fuel: false,
                                        controller: addVehicleController
                                            .transmissionController),
                                    Wrap(
                                      children: [
                                        GridView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemCount: addVehicleController
                                              .selectedImages.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 0,
                                          ),
                                          itemBuilder: (context, index) {
                                            return Stack(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    child: Image.file(
                                                      addVehicleController
                                                              .selectedImages[
                                                          index],
                                                      fit: BoxFit.cover,
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      addVehicleController
                                                          .deleteVehicleImage(
                                                              widget.vehicleData
                                                                  .id,
                                                              widget.vehicleData
                                                                      .images[
                                                                  index]);
                                                      addVehicleController
                                                          .selectedImages
                                                          .removeAt(index);
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      size: 40,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        addVehicleController.pickImage(
                                            const CropAspectRatio(
                                                ratioX: 16, ratioY: 9));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  'lib/image/blackBmw.jpeg'),
                                              fit: BoxFit.cover,
                                            ),
                                            color: Colors.black26,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          height: size.height / 9,
                                          width: size.width,
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.camera_alt,
                                                size: 35,
                                                color: Colors.white,
                                              ),
                                              HindTextWidget(
                                                isBold: false,
                                                left: 0,
                                                top: 0,
                                                text: 'ADD YOUR VEHICLE IMAGES',
                                                size: 19,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
