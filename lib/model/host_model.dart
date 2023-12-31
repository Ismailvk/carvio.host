class HostModel {
  String id;
  String name;
  String email;
  int phone;
  String password;
  bool isBlocked;
  bool isVerified;
  String? profilePicture;

  HostModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.isBlocked,
      required this.isVerified,
      this.profilePicture});

  factory HostModel.fromJson(Map<String, dynamic> json) => HostModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        isBlocked: json['isBlocked'],
        isVerified: json['isVerified'],
        profilePicture: json['profile'],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "isBlocked": isBlocked,
        "isVerified": isVerified,
        "profile": profilePicture,
      };
}
