import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:second_project/utils/map_box.dart';
import 'package:second_project/view_model/add_vehicle_controller.dart';

class MapBoxController extends GetxController {
  LatLng latlong = const LatLng(9.931233, 76.267303);
  TextEditingController mapLoctionController = TextEditingController();
  LatLng? selectedLatLng;
  var searchResults = [];
  final place = ''.obs;
  MapController mapController = MapController();

  onTaped(LatLng newLatLng) {
    latlong = newLatLng;
    selectedLatLng = newLatLng;
    update();
  }

  onSubmitted(String enteredValue) async {
    searchResults = await MapBoxHelper.getSearchResults(enteredValue);
    update();
  }

  onSelected(LatLng newLatLng) {
    latlong = newLatLng;
    selectedLatLng = newLatLng;
    mapController.move(latlong, 15);
    searchResults.clear();
    update();
  }

  String getOnlyFirstName(String fullPlaceName) {
    List<String> parts = fullPlaceName.split(RegExp(r'[,|-]'));
    String firstName =
        parts.firstWhere((part) => part.trim().isNotEmpty, orElse: () => '');
    AddVehicleController controller = Get.put(AddVehicleController());
    controller.locationController.text = firstName.trim();
    mapLoctionController.text = firstName.trim();
    return firstName.trim();
  }
}
