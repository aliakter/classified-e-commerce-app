import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  int id;
  String name;
  String username;
  String email;
  int showEmail;
  int receiveEmail;
  String phone;
  int showPhone;
  dynamic emailVerifiedAt;
  String web;
  String image;
  String token;
  DateTime lastSeen;
  DateTime createdAt;
  DateTime updatedAt;
  String authType;
  dynamic provider;
  dynamic providerId;
  int isSocialLogin;
  int socialToBusiness;
  dynamic fcmToken;
  String aboutPublicProfile;
  String openingHour;
  String closingHours;
  Plan plan;
  String imageUrl;
  int unread;
  Plan userPlan;

  UserProfileModel({
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
    required this.plan,
    required this.imageUrl,
    required this.unread,
    required this.userPlan,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    id: json["id"] ?? 0,
    name: json["name"] ?? '',
    username: json["username"] ?? '',
    email: json["email"] ?? '',
    showEmail: json["show_email"] ?? 0,
    receiveEmail: json["receive_email"] ?? 0,
    phone: json["phone"] ?? '',
    showPhone: json["show_phone"] ?? 0,
    emailVerifiedAt: json["email_verified_at"],
    web: json["web"] ?? '',
    image: json["image"] ?? '',
    token: json["token"] ?? '',
    lastSeen: json["last_seen"] != null ? DateTime.parse(json["last_seen"]) : DateTime.now(),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    authType: json["auth_type"] ?? '',
    provider: json["provider"],
    providerId: json["provider_id"],
    isSocialLogin: json["is_social_login"],
    socialToBusiness: json["social_to_business"],
    fcmToken: json["fcm_token"],
    aboutPublicProfile: json["about_public_profile"] ?? '',
    openingHour: json["opening_hour"] ?? '',
    closingHours: json["closing_hours"] ?? '',
    plan: Plan.fromJson(json["plan"]),
    imageUrl: json["image_url"] ?? '',
    unread: json["unread"] ?? 0,
    userPlan: Plan.fromJson(json["user_plan"]),
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
    "last_seen": lastSeen.toIso8601String(),
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
    "plan": plan.toJson(),
    "image_url": imageUrl,
    "unread": unread,
    "user_plan": userPlan.toJson(),
  };
}

class Plan {
  int id;
  int userId;
  int adLimit;
  int featuredLimit;
  int businessDirectoryLimit;
  int eventLimit;
  bool badge;
  DateTime createdAt;
  DateTime updatedAt;
  String subscriptionType;
  dynamic expiredDate;
  dynamic currentPlanId;
  bool isRestoredPlanBenefits;
  bool remainingDays;
  bool planExpired;

  Plan({
    required this.id,
    required this.userId,
    required this.adLimit,
    required this.featuredLimit,
    required this.businessDirectoryLimit,
    required this.eventLimit,
    required this.badge,
    required this.createdAt,
    required this.updatedAt,
    required this.subscriptionType,
    required this.expiredDate,
    required this.currentPlanId,
    required this.isRestoredPlanBenefits,
    required this.remainingDays,
    required this.planExpired,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    id: json["id"] ?? 0,
    userId: json["user_id"] ?? 0,
    adLimit: json["ad_limit"] ?? 0,
    featuredLimit: json["featured_limit"] ?? 0,
    businessDirectoryLimit: json["business_directory_limit"] ?? 0,
    eventLimit: json["event_limit"] ?? 0,
    badge: json["badge"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    subscriptionType: json["subscription_type"] ?? '',
    expiredDate: json["expired_date"],
    currentPlanId: json["current_plan_id"],
    isRestoredPlanBenefits: json["is_restored_plan_benefits"],
    remainingDays: json["remaining_days"],
    planExpired: json["plan_expired"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "ad_limit": adLimit,
    "featured_limit": featuredLimit,
    "business_directory_limit": businessDirectoryLimit,
    "event_limit": eventLimit,
    "badge": badge,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "subscription_type": subscriptionType,
    "expired_date": expiredDate,
    "current_plan_id": currentPlanId,
    "is_restored_plan_benefits": isRestoredPlanBenefits,
    "remaining_days": remainingDays,
    "plan_expired": planExpired,
  };
}
