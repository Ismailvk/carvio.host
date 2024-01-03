import 'dart:convert';

import 'package:get/get.dart';
import 'package:second_project/model/revenue_model.dart';
import 'package:second_project/service/api_service.dart';
import 'package:second_project/service/shared_preference.dart';

class DashBoardController extends GetxController {
  Rx<RevenueModel?> dashBoardData = Rx<RevenueModel?>(null);

  dashboardData() async {
    try {
      final token = SharedPreference.instance.getToke();
      if (token == null) {
        return Get.snackbar('Error', 'Please login again');
      }
      final response = await ApiService.instance.dashBoard(token);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        dashBoardData.value = RevenueModel.fromJson(data);
      } else if (response.statusCode != 200) {
        final data = jsonDecode(response.body);
        Get.snackbar("Error", data['message']);
      }
    } catch (e) {
      Get.snackbar("Error", 'You got $e');
    }
  }
}
