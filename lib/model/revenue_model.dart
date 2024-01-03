class VehicleDetails {
  String id;
  String name;
  int price;
  int model;
  String transmission;
  String brand;
  String fuel;
  String location;
  String createdBy;
  List<String> images;
  bool isVerified;
  List<dynamic> review;
  int v;
  String document;

  VehicleDetails({
    required this.id,
    required this.name,
    required this.price,
    required this.model,
    required this.transmission,
    required this.brand,
    required this.fuel,
    required this.location,
    required this.createdBy,
    required this.images,
    required this.isVerified,
    required this.review,
    required this.v,
    required this.document,
  });

  factory VehicleDetails.fromJson(Map<String, dynamic> json) {
    return VehicleDetails(
      id: json['_id'],
      name: json['name'],
      price: json['price'],
      model: json['model'],
      transmission: json['transmission'],
      brand: json['brand'],
      fuel: json['fuel'],
      location: json['location'],
      createdBy: json['createdBy'],
      images: List<String>.from(json['images']),
      isVerified: json['isVerified'],
      review: List<dynamic>.from(json['review']),
      v: json['__v'],
      document: json['document'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'price': price,
      'model': model,
      'transmission': transmission,
      'brand': brand,
      'fuel': fuel,
      'location': location,
      'createdBy': createdBy,
      'images': images,
      'isVerified': isVerified,
      'review': review,
      '__v': v,
      'document': document,
    };
  }
}

class LatestOrder {
  String id;
  String userId;
  String vehicleId;
  String startDate;
  String endDate;
  String pickup;
  String dropoff;
  int total;
  int grandTotal;
  String razorId;
  String status;
  int v;
  VehicleDetails vehicleDetails;
  UserDetails userDetails;

  LatestOrder({
    required this.id,
    required this.userId,
    required this.vehicleId,
    required this.startDate,
    required this.endDate,
    required this.pickup,
    required this.dropoff,
    required this.total,
    required this.grandTotal,
    required this.razorId,
    required this.status,
    required this.v,
    required this.vehicleDetails,
    required this.userDetails,
  });

  factory LatestOrder.fromJson(Map<String, dynamic> json) {
    return LatestOrder(
      id: json['_id'],
      userId: json['userId'],
      vehicleId: json['vehicleId'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      pickup: json['pickup'],
      dropoff: json['dropoff'],
      total: json['total'],
      grandTotal: json['grandTotal'],
      razorId: json['razorId'],
      status: json['status'],
      v: json['__v'],
      vehicleDetails: VehicleDetails.fromJson(json['vehicleDetails']),
      userDetails: UserDetails.fromJson(json['userDetails']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'vehicleId': vehicleId,
      'startDate': startDate,
      'endDate': endDate,
      'pickup': pickup,
      'dropoff': dropoff,
      'total': total,
      'grandTotal': grandTotal,
      'razorId': razorId,
      'status': status,
      '__v': v,
      'vehicleDetails': vehicleDetails.toJson(),
      'userDetails': userDetails.toJson(),
    };
  }
}

class UserDetails {
  String id;
  String name;
  String email;
  int phone;
  String password;
  bool isBlocked;
  int v;
  String profile;
  int wallet;
  Choices choices;

  UserDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.isBlocked,
    required this.v,
    required this.profile,
    required this.wallet,
    required this.choices,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      isBlocked: json['isBlocked'],
      v: json['__v'],
      profile: json['profile'],
      wallet: json['wallet'],
      choices: Choices.fromJson(json['choices']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'isBlocked': isBlocked,
      '__v': v,
      'profile': profile,
      'wallet': wallet,
      'choices': choices.toJson(),
    };
  }
}

class Choices {
  String startDate;
  String endDate;
  String pickup;
  String dropoff;

  Choices({
    required this.startDate,
    required this.endDate,
    required this.pickup,
    required this.dropoff,
  });

  factory Choices.fromJson(Map<String, dynamic> json) {
    return Choices(
      startDate: json['startDate'],
      endDate: json['endDate'],
      pickup: json['pickup'],
      dropoff: json['dropoff'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startDate': startDate,
      'endDate': endDate,
      'pickup': pickup,
      'dropoff': dropoff,
    };
  }
}

class RevenueModel {
  int hostRevenue;
  Trending trending;
  int bookedCount;
  int completedCount;
  int cancelledBooking;
  List<LatestOrder> latestOrders;

  RevenueModel({
    required this.hostRevenue,
    required this.trending,
    required this.bookedCount,
    required this.completedCount,
    required this.cancelledBooking,
    required this.latestOrders,
  });

  factory RevenueModel.fromJson(Map<String, dynamic> json) {
    return RevenueModel(
      hostRevenue: json['hostRevenue'],
      trending: Trending.fromJson(json['trending']),
      bookedCount: json['bookedCount'],
      completedCount: json['completedCount'],
      cancelledBooking: json['cancelledBooking'],
      latestOrders: List<LatestOrder>.from(
          json['latestOrders'].map((x) => LatestOrder.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hostRevenue': hostRevenue,
      'trending': trending.toJson(),
      'bookedCount': bookedCount,
      'completedCount': completedCount,
      'cancelledBooking': cancelledBooking,
      'latestOrders': List<dynamic>.from(latestOrders.map((x) => x.toJson())),
    };
  }
}

class Trending {
  String id;
  String name;
  int price;
  int model;
  String transmission;
  String brand;
  String fuel;
  String location;
  String createdBy;
  List<String> images;
  bool isVerified;
  List<dynamic> review;
  int v;
  String document;

  Trending({
    required this.id,
    required this.name,
    required this.price,
    required this.model,
    required this.transmission,
    required this.brand,
    required this.fuel,
    required this.location,
    required this.createdBy,
    required this.images,
    required this.isVerified,
    required this.review,
    required this.v,
    required this.document,
  });

  factory Trending.fromJson(Map<String, dynamic> json) {
    return Trending(
      id: json['_id'],
      name: json['name'],
      price: json['price'],
      model: json['model'],
      transmission: json['transmission'],
      brand: json['brand'],
      fuel: json['fuel'],
      location: json['location'],
      createdBy: json['createdBy'],
      images: List<String>.from(json['images']),
      isVerified: json['isVerified'],
      review: List<dynamic>.from(json['review']),
      v: json['__v'],
      document: json['document'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'price': price,
      'model': model,
      'transmission': transmission,
      'brand': brand,
      'fuel': fuel,
      'location': location,
      'createdBy': createdBy,
      'images': images,
      'isVerified': isVerified,
      'review': review,
      '__v': v,
      'document': document,
    };
  }
}
