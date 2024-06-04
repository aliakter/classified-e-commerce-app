class ChatDetailsModel {
  final int status;
  final bool success;
  final int code;
  final String message;
  final Description description;
  final Data data;

  ChatDetailsModel({
    required this.status,
    required this.success,
    required this.code,
    required this.message,
    required this.description,
    required this.data,
  });

  factory ChatDetailsModel.fromJson(Map<String, dynamic> json) =>
      ChatDetailsModel(
        status: json["status"],
        success: json["success"],
        code: json["code"],
        message: json["message"],
        description: Description.fromJson(json["description"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "code": code,
        "message": message,
        "description": description.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  final User user;
  final User selectedUser;
  final List<Message> messages;

  Data({
    required this.user,
    required this.selectedUser,
    required this.messages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        selectedUser: User.fromJson(json["selected_user"]),
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "selected_user": selectedUser.toJson(),
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
      };
}

class Message {
  final int id;
  final int fromId;
  final int toId;
  final String body;
  final int read;
  final DateTime createdAt;
  final DateTime updatedAt;

  Message({
    required this.id,
    required this.fromId,
    required this.toId,
    required this.body,
    required this.read,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        fromId: json["from_id"],
        toId: json["to_id"],
        body: json["body"],
        read: json["read"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "from_id": fromId,
        "to_id": toId,
        "body": body,
        "read": read,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final dynamic showEmail;
  final int receiveEmail;
  final String? phone;
  final dynamic showPhone;
  final DateTime? emailVerifiedAt;
  final dynamic web;
  final String image;
  final dynamic token;
  //final DateTime? lastSeen;
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

  User({
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
    //required this.lastSeen,
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        showEmail: json["show_email"],
        receiveEmail: json["receive_email"],
        phone: json["phone"],
        showPhone: json["show_phone"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        web: json["web"],
        image: json["image"],
        token: json["token"],
        // lastSeen: DateTime.parse(json["last_seen"]),
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
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "web": web,
        "image": image,
        "token": token,
        //"last_seen": lastSeen?.toIso8601String(),
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

class Description {
  final String username;

  Description({
    required this.username,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}
