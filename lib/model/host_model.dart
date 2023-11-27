// To parse this JSON data, do
// final hostModel = hostModelFromJson(jsonString);
// import 'dart:convert';
// HostModel hostModelFromJson(String str) => HostModel.fromJson(json.decode(str));
// String hostModelToJson(HostModel data) => json.encode(data.toJson());

class HostModel {
  String id;
  String name;
  String email;
  int phone;
  String password;
  bool isBlocked;
  bool isVerified;

  HostModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.isBlocked,
      required this.isVerified});

  factory HostModel.fromJson(Map<String, dynamic> json) => HostModel(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"],
      isBlocked: json['isBlocked'],
      isVerified: json['isVerified']);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "isBlocked": isBlocked,
        "isVerified": isVerified
      };
}
