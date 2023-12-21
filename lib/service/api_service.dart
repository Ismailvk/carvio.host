import 'dart:convert';
import 'dart:io';
// ignore: unused_import, depend_on_referenced_packages
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:second_project/service/api_url.dart';
import 'package:second_project/service/shared_preference.dart';

class ApiService {
  ApiService._();
  static final ApiService _instance = ApiService._();
  static ApiService get instance => _instance;
  // String token;
  final headers = {'Content-Type': 'application/json'};
  // final headerss = {'Authorization': 'Bearer $token'};

  Future<http.Response> hostSignup(Map<String, dynamic> hostDetails) async {
    final url = Uri.parse("${Urls.baseUrl}/${Urls.signUp}");
    final body = jsonEncode(hostDetails);
    final response = await http.post(url, body: body, headers: headers);
    return response;
  }

  Future<http.Response> hostOtp(Map<String, int?> otp) async {
    final url = Uri.parse("${Urls.baseUrl}/${Urls.verufyOtp}");
    final body = jsonEncode(otp);
    final response = await http.post(url, body: body, headers: headers);
    print(response.body);
    return response;
  }

  Future<http.Response> getHostDetails(String token) async {
    final url = Uri.parse("${Urls.baseUrl}/${Urls.getHostDetais}");
    final header = {
      'Authorization': 'Bearer $token',
      'Cookie': 'jwtHost=$token'
    };
    final response = await http.get(url, headers: header);
    return response;
  }

  Future<http.Response> loginHost(Map<String, String> logindata) async {
    final url = Uri.parse("${Urls.baseUrl}/${Urls.loginHost}");
    final body = jsonEncode(logindata);
    final response = await http.post(url, body: body, headers: headers);
    print(response.statusCode);
    return response;
  }

  Future<http.StreamedResponse> addVehicle(Map<String, dynamic> vehicleData,
      List<File> images, File document) async {
    final url = Uri.parse("${Urls.baseUrl}/${Urls.addVehicle}");
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
    final url = Uri.parse("${Urls.baseUrl}/${Urls.getHostVehicle}");
    final header = {
      'Authorization': 'Bearer $token',
      'Cookie': 'jwtHost=$token'
    };
    final response = await http.get(url, headers: header);
    return response;
  }

  Future<http.Response> deleteVehicle(String id, String token) async {
    final url = Uri.parse('${Urls.baseUrl}/${Urls.deleteVehicle}/$id');
    final header = {
      'Authorization': 'Bearer $token',
      'Cookie': 'jwtHost=$token'
    };
    final response = await http.delete(url, headers: header);
    return response;
  }

  Future<http.StreamedResponse> editVehicle(
      String id, Map<String, dynamic> vehicleData, List<File> images) async {
    final url = Uri.parse('${Urls.baseUrl}/${Urls.editVehicle}/$id');
    var request = http.MultipartRequest('PATCH', url);
    final token = SharedPreference.instance.getToke();
    // HEADERS
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Cookie'] = 'jwtHost=$token';
    // SET SENDING IMAGES
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
    request.fields['name'] = vehicleData['name'];
    request.fields['brand'] = vehicleData['brand'];
    request.fields['location'] = vehicleData['location'];
    request.fields['price'] = vehicleData['price'].toString();
    request.fields['model'] = vehicleData['model'].toString();
    request.fields['transmission'] = vehicleData['transmission'];
    request.fields['fuel'] = vehicleData['fuel'];

    var response = await request.send();

    return response;
  }

  deleteVehicleImages(String vehicleId, String imageId, String token) async {
    final url = Uri.parse(
        '${Urls.baseUrl}/${Urls.deleteVehicleImage}/$vehicleId?file=$imageId');
    final header = {
      'Authorization': 'Bearer $token',
      'Cookie': 'jwtHost=$token',
      'Content-Type': 'application/json'
    };
    final body = await http.patch(url, headers: header);
    print(body.statusCode);
  }

  Future<http.Response> editHosData(
      Map<String, dynamic> hostData, String token) async {
    final url = Uri.parse('${Urls.baseUrl}/${Urls.editHostData}');
    final body = jsonEncode(hostData);
    final header = {
      'Authorization': 'Bearer $token',
      'Cookie': 'jwtHost=$token',
      'Content-Type': 'application/json'
    };
    final response = await http.patch(url, body: body, headers: header);
    return response;
  }

  Future<http.StreamedResponse> profileUpdate(File image) async {
    final token = SharedPreference.instance.getToke();
    final url = Uri.parse('${Urls.baseUrl}/${Urls.uploadProfile}');

    var request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Cookie'] = 'jwtHost=$token';

    var profilePhotoStream = http.ByteStream(image.openRead());
    var profilePhotoLength = await image.length();
    var profilePhotoMultipartFile = http.MultipartFile(
      'file',
      profilePhotoStream,
      profilePhotoLength,
      filename: 'profilephoto.jpg',
    );
    request.files.add(profilePhotoMultipartFile);
    final response = await request.send();
    print(response.statusCode);
    return response;
  }

  Future<http.Response> forgetPassword(Map<String, String> email) async {
    final url = Uri.parse('${Urls.baseUrl}/${Urls.forgetPassword}');
    final body = jsonEncode(email);
    final response = await http.post(url, headers: headers, body: body);
    print(response.statusCode);
    return response;
  }

  Future<http.Response> changePassword(
      String token, Map<String, String> changedPassword) async {
    final url = Uri.parse('${Urls.baseUrl}/${Urls.changePassword}');
    final body = jsonEncode(changedPassword);
    final header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Cookie': 'jwtHost=$token'
    };
    final response = await http.patch(url, headers: header, body: body);
    print(response.statusCode);
    return response;
  }
}
