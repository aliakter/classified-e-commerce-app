class UserPlanModel {
  final bool success;
  final String lastTransactionStatus;
  final Plan plan;

  UserPlanModel({
    required this.success,
    required this.lastTransactionStatus,
    required this.plan,
  });

  factory UserPlanModel.fromJson(Map<String, dynamic> json) => UserPlanModel(
        success: json["success"],
        lastTransactionStatus: json["last_transaction_status"],
        plan: Plan.fromJson(json["plan"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "last_transaction_status": lastTransactionStatus,
        "plan": plan.toJson(),
      };
}

class Plan {
  final int adLimit;
  final int featuredLimit;
  final bool badge;
  final int eventLimit;
  final int businessDirectoryLimit;

  Plan({
    required this.adLimit,
    required this.featuredLimit,
    required this.badge,
    required this.eventLimit,
    required this.businessDirectoryLimit,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        adLimit: json["ad_limit"],
        featuredLimit: json["featured_limit"],
        badge: json["badge"],
        eventLimit: json["event_limit"],
        businessDirectoryLimit: json["business_directory_limit"],
      );

  Map<String, dynamic> toJson() => {
        "ad_limit": adLimit,
        "featured_limit": featuredLimit,
        "badge": badge,
        "event_limit": eventLimit,
        "business_directory_limit": businessDirectoryLimit,
      };
}
