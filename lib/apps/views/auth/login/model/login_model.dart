import 'dart:convert';

class UserLoginResponseModel {
  final String loginToken;
  final String regToken;
  final User user;
  final String tokenType;

  UserLoginResponseModel(
      {required this.loginToken,
      required this.regToken,
      required this.user,
      required this.tokenType});

  factory UserLoginResponseModel.fromJson(String str) =>
      UserLoginResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserLoginResponseModel.fromMap(Map<String, dynamic> json) =>
      UserLoginResponseModel(
        loginToken: json["access_token"] ?? "",
        regToken: json["expires_in"] is int
            ? json["expires_in"].toString()
            : json["expires_in"] ?? "",
        user: User.fromMap(json["user"]),
        tokenType: json["token_type"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "access_token": loginToken,
        "expires_in": regToken,
        "user": user.toMap(),
        "token_type": tokenType,
      };
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final dynamic phone;
  final dynamic emailVerifiedAt;
  final dynamic web;
  final String image;
  final String token;
  final dynamic lastSeen;
  final String authType;
  final dynamic provider;
  final dynamic providerId;
  final dynamic fcmToken;
  final int totalAds;
  final dynamic location;
  final dynamic address;
  final dynamic city;
  final dynamic state;
  final dynamic zipcode;
  final dynamic country;
  final String countryCode;
  final dynamic ipAddress;
  final dynamic timeZone;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic device;
  final dynamic browser;
  final int totalReview;
  final int averageReview;
  final String createdAt;
  final dynamic updatedBy;
  final String updatedAt;
  final dynamic createdBy;
  final int status;
  final dynamic website;
  final String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.emailVerifiedAt,
    required this.web,
    required this.image,
    required this.token,
    required this.lastSeen,
    required this.authType,
    required this.provider,
    required this.providerId,
    required this.fcmToken,
    required this.totalAds,
    required this.location,
    required this.address,
    required this.city,
    required this.state,
    required this.zipcode,
    required this.country,
    required this.countryCode,
    required this.ipAddress,
    required this.timeZone,
    required this.latitude,
    required this.longitude,
    required this.device,
    required this.browser,
    required this.totalReview,
    required this.averageReview,
    required this.createdAt,
    required this.updatedBy,
    required this.updatedAt,
    required this.createdBy,
    required this.status,
    required this.website,
    required this.imageUrl,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"] ?? "",
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        phone: json["phone"],
        emailVerifiedAt: json["email_verified_at"],
        web: json["web"],
        image: json["image"] ?? "",
        token: json["token"] ?? "",
        lastSeen: json["last_seen"],
        authType: json["auth_type"] ?? "",
        provider: json["provider"],
        providerId: json["provider_id"],
        fcmToken: json["fcm_token"],
        totalAds: json["total_ads"] ?? 0,
        location: json["location"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zipcode: json["zipcode"],
        country: json["country"] ?? "",
        countryCode: json["country_code"] ?? "",
        ipAddress: json["ip_address"],
        timeZone: json["time_zone"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        device: json["device"],
        browser: json["browser"],
        totalReview: json["total_review"] ?? 0,
        averageReview: json["average_review"] ?? 0,
        createdAt: json["created_at"] ?? "",
        updatedBy: json["updated_by"],
        updatedAt: json["updated_at"] ?? "",
        createdBy: json["created_by"],
        status: json["status"] ?? 0,
        website: json["website"],
        imageUrl: json["image_url"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "phone": phone,
        "email_verified_at": emailVerifiedAt,
        "web": web,
        "image": image,
        "token": token,
        "last_seen": lastSeen,
        "auth_type": authType,
        "provider": provider,
        "provider_id": providerId,
        "fcm_token": fcmToken,
        "total_ads": totalAds,
        "location": location,
        "address": address,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "country": country,
        "country_code": countryCode,
        "ip_address": ipAddress,
        "time_zone": timeZone,
        "latitude": latitude,
        "longitude": longitude,
        "device": device,
        "browser": browser,
        "total_review": totalReview,
        "average_review": averageReview,
        "created_at": createdAt,
        "updated_by": updatedBy,
        "updated_at": updatedAt,
        "created_by": createdBy,
        "status": status,
        "website": website,
        "image_url": imageUrl,
      };
}
