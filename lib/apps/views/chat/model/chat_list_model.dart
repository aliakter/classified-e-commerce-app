class ChatListModel {
  final int status;
  final bool success;
  final int code;
  final String message;
  final List<dynamic> description;
  final Data data;

  ChatListModel({
    required this.status,
    required this.success,
    required this.code,
    required this.message,
    required this.description,
    required this.data,
  });

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
        status: json["status"],
        success: json["success"],
        code: json["code"],
        message: json["message"],
        description: List<dynamic>.from(json["description"].map((x) => x)),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "code": code,
        "message": message,
        "description": List<dynamic>.from(description.map((x) => x)),
        "data": data.toJson(),
      };
}

class Data {
  final PurpleUser user;
  final List<UserElement> users;

  Data({
    required this.user,
    required this.users,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: PurpleUser.fromJson(json["user"]),
        users: List<UserElement>.from(
            json["users"].map((x) => UserElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class PurpleUser {
  final int id;
  final String name;
  final String username;
  final String email;
  final dynamic showEmail;
  final int receiveEmail;
  final dynamic phone;
  final dynamic showPhone;
  final dynamic emailVerifiedAt;
  final dynamic web;
  final String image;
  final dynamic token;
  final DateTime? lastSeen;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String authType;
  final dynamic provider;
  final dynamic providerId;
  final int isSocialLogin;
  final int socialToBusiness;
  final dynamic fcmToken;
  final dynamic aboutPublicProfile;
  final dynamic openingHour;
  final dynamic closingHours;
  final String imageUrl;
  final int unread;

  PurpleUser({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.showEmail,
    required this.receiveEmail,
    required this.phone,
    required this.showPhone,
    required this.emailVerifiedAt,
    required this.web,
    required this.image,
    required this.token,
    required this.lastSeen,
    required this.createdAt,
    required this.updatedAt,
    required this.authType,
    required this.provider,
    required this.providerId,
    required this.isSocialLogin,
    required this.socialToBusiness,
    required this.fcmToken,
    required this.aboutPublicProfile,
    required this.openingHour,
    required this.closingHours,
    required this.imageUrl,
    required this.unread,
  });

  factory PurpleUser.fromJson(Map<String, dynamic> json) => PurpleUser(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        showEmail: json["show_email"],
        receiveEmail: json["receive_email"],
        phone: json["phone"],
        showPhone: json["show_phone"],
        emailVerifiedAt: json["email_verified_at"],
        web: json["web"],
        image: json["image"],
        token: json["token"],
        lastSeen: json['last_seen'] == null
            ? null
            : DateTime.parse(json["last_seen"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        authType: json["auth_type"],
        provider: json["provider"],
        providerId: json["provider_id"],
        isSocialLogin: json["is_social_login"],
        socialToBusiness: json["social_to_business"],
        fcmToken: json["fcm_token"],
        aboutPublicProfile: json["about_public_profile"],
        openingHour: json["opening_hour"],
        closingHours: json["closing_hours"],
        imageUrl: json["image_url"],
        unread: json["unread"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "show_email": showEmail,
        "receive_email": receiveEmail,
        "phone": phone,
        "show_phone": showPhone,
        "email_verified_at": emailVerifiedAt,
        "web": web,
        "image": image,
        "token": token,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "auth_type": authType,
        "provider": provider,
        "provider_id": providerId,
        "is_social_login": isSocialLogin,
        "social_to_business": socialToBusiness,
        "fcm_token": fcmToken,
        "about_public_profile": aboutPublicProfile,
        "opening_hour": openingHour,
        "closing_hours": closingHours,
        "image_url": imageUrl,
        "unread": unread,
      };
}

class UserElement {
  final int id;
  final String name;
  final String username;
  final String image;
  final DateTime createdAt;
  final String body;
  final String imageUrl;

  UserElement({
    required this.id,
    required this.name,
    required this.username,
    required this.image,
    required this.createdAt,
    required this.body,
    required this.imageUrl,
  });

  factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        body: json["body"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "body": body,
        "image_url": imageUrl,
      };
}
