import 'dart:convert';
import 'dart:io';
// ignore: unused_import, depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:second_project/service/shared_preference.dart';

class ApiService {
  ApiService._();
  static final ApiService _instance = ApiService._();
  static ApiService get instance => _instance;
  // String token;
  final headers = {'Content-Type': 'application/json'};
  // final headerss = {'Authorization': 'Bearer $token'};

  Future<http.Response> hostSignup(Map<String, dynamic> hostDetails) async {
    final url = Uri.parse("http://10.0.2.2:3000/host/signup");
    final body = jsonEncode(hostDetails);
    final response = await http.post(url, body: body, headers: headers);
    return response;
  }

  Future<http.Response> hostOtp(Map<String, int?> otp) async {
    final url = Uri.parse("http://10.0.2.2:3000/host/verify-otp");
    final body = jsonEncode(otp);
    final response = await http.post(url, body: body, headers: headers);
    print(response.body);
    return response;
  }

  Future<http.Response> getHostDetails(String token) async {
    final url = Uri.parse("http://10.0.2.2:3000/host/host-details");
    final header = {
      'Authorization': 'Bearer $token',
      'Cookie': 'jwtHost=$token'
    };
    final response = await http.get(url, headers: header);
    return response;
  }

  Future<http.Response> loginHost(Map<String, String> logindata) async {
    final url = Uri.parse("http://10.0.2.2:3000/host/login");
    final body = jsonEncode(logindata);
    final response = await http.post(url, body: body, headers: headers);
    print(response.statusCode);
    return response;
  }

  Future<http.StreamedResponse> addVehicle(Map<String, dynamic> vehicleData,
      List<File> images, File document) async {
    final url = Uri.parse("http://10.0.2.2:3000/host/add-vehicle");
    var request = http.MultipartRequest('POST', url);
    final token = SharedPreference.instance.getToke();
    // headers
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Cookie'] = 'jwtHost=$token';
    // send image
    for (var i = 0; i < images.length; i++) {
      var stream = http.ByteStream(images[i].openRead());
      var length = await images[i].length();

      var multipartFile = http.MultipartFile(
        'files',
        stream,
        length,
        filename: 'image$i.jpg',
      );

      request.files.add(multipartFile);
    }
    var documentStream = http.ByteStream(document.openRead());
    var documentLength = await document.length();
    var documentMultipartFile = http.MultipartFile(
      'doc',
      documentStream,
      documentLength,
      filename: 'document.jpg',
    );
    String? number = vehicleData['number']?.toString();
    String? price = vehicleData['price']?.toString();
    String? model = vehicleData['model']?.toString();
    request.files.add(documentMultipartFile);
    request.fields['name'] = vehicleData['name'];
    request.fields['brand'] = vehicleData['brand'];
    request.fields['location'] = vehicleData['location'];
    request.fields['number'] = number ?? '';
    request.fields['price'] = price ?? '0';
    request.fields['model'] = model ?? '';
    request.fields['transmission'] = vehicleData['transmission'];
    request.fields['fuel'] = vehicleData['fuel'];

    var response = await request.send();

    return response;
  }

  Future<http.Response> getHostVehicles(String token) async {
    final url = Uri.parse("http://10.0.2.2:3000/host/host-vehicles");
    final header = {
      'Authorization': 'Bearer $token',
      'Cookie': 'jwtHost=$token'
    };
    final response = await http.get(url, headers: header);
    return response;
  }
}
