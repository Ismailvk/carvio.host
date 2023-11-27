import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/view_model/map_box_controller.dart';

// ignore: must_be_immutable
class VehicleAddMapScreen extends StatelessWidget {
  VehicleAddMapScreen({super.key});
  MapBoxController mapController = Get.put(MapBoxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<MapBoxController>(
          builder: (mapboxcontroller) {
            return Stack(
              children: [
                FlutterMap(
                  mapController: mapController.mapController,
                  options: MapOptions(
                    initialCenter: mapController.latlong,
                    initialZoom: 14,
                    onTap: (tapPosition, point) {
                      mapController.onTaped(point);
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://api.mapbox.com/styles/v1/ismailvk/clp9licsc002201po1gh6bjt9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaXNtYWlsdmsiLCJhIjoiY2xwOWtvZjF5MDM2dTJpcWlndHJ1Mnh0dyJ9.plsEL1xGKiKwrCuP36uc5Q",
                      additionalOptions: const {
                        "accessToken":
                            "pk.eyJ1IjoiaXNtYWlsdmsiLCJhIjoiY2xwOWtvZjF5MDM2dTJpcWlndHJ1Mnh0dyJ9.plsEL1xGKiKwrCuP36uc5Q",
                        "id": "mapbox.mapbox-streets-v8"
                      },
                    ),
                    MarkerLayer(alignment: Alignment.center, markers: [
                      Marker(
                        height: 100,
                        width: 100,
                        point: mapController.latlong,
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 35,
                        ),
                      )
                    ])
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                  child: Card(
                    child: TextField(
                      onSubmitted: (value) async {
                        mapController.onSubmitted(value);
                      },
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        hintText: 'Search Your Location',
                        hintStyle: TextStyle(color: deepPurple),
                        contentPadding: const EdgeInsets.all(15),
                        prefixIcon: Icon(
                          Icons.location_on_outlined,
                          color: deepPurple,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8 + 60,
                  left: 20,
                  right: 20,
                  child: Visibility(
                    visible: mapController.searchResults.isNotEmpty,
                    child: SizedBox(
                      height: Get.height * .4,
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                child: ListTile(
                                  leading: const Icon(Icons.search),
                                  horizontalTitleGap: 0,
                                  title: Text(
                                    mapboxcontroller.searchResults[index]
                                            ['placeName']
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onTap: () {
                                    String fullPlaceName = mapboxcontroller
                                        .searchResults[index]['placeName'];
                                    String placeName = mapController
                                        .getOnlyFirstName(fullPlaceName);
                                    mapController.place.value = placeName;
                                    final newlatlong = LatLng(
                                      mapboxcontroller.searchResults[index]
                                          ['latitude'],
                                      mapboxcontroller.searchResults[index]
                                          ['longitude'],
                                    );
                                    mapController.onSelected(newlatlong);
                                  },
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(),
                          itemCount: mapController.searchResults.length),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  // left: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          width: Get.width / 1.34,
                          height: Get.height / 14,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: TextField(
                            controller: mapController.mapLoctionController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: white,
                                border: const OutlineInputBorder()),
                          ),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () => Get.back(),
                          child: Container(
                            width: Get.width / 7,
                            height: Get.height / 14,
                            decoration: BoxDecoration(
                              color: deepPurple,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 30,
                              color: white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
