import 'dart:convert';

class TransactionModel {
  final int id;
  final String orderId;
  final String transactionId;
  final String paymentProvider;
  final int planId;
  final int userId;
  final String amount;
  final dynamic appliedCouponCode;
  final String currencySymbol;
  final String usdAmount;
  final String paymentStatus;
  final dynamic proof;
  final dynamic comment;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Plan plan;

  TransactionModel({
    required this.id,
    required this.orderId,
    required this.transactionId,
    required this.paymentProvider,
    required this.planId,
    required this.userId,
    required this.amount,
    required this.appliedCouponCode,
    required this.currencySymbol,
    required this.usdAmount,
    required this.paymentStatus,
    required this.proof,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.plan,
  });

  factory TransactionModel.fromRawJson(String str) =>
      TransactionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"],
        orderId: json["order_id"],
        transactionId: json["transaction_id"],
        paymentProvider: json["payment_provider"],
        planId: json["plan_id"],
        userId: json["user_id"],
        amount: json["amount"],
        appliedCouponCode: json["applied_coupon_code"],
        currencySymbol: json["currency_symbol"],
        usdAmount: json["usd_amount"],
        paymentStatus: json["payment_status"],
        proof: json["proof"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        plan: Plan.fromJson(json["plan"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "transaction_id": transactionId,
        "payment_provider": paymentProvider,
        "plan_id": planId,
        "user_id": userId,
        "amount": amount,
        "applied_coupon_code": appliedCouponCode,
        "currency_symbol": currencySymbol,
        "usd_amount": usdAmount,
        "payment_status": paymentStatus,
        "proof": proof,
        "comment": comment,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "plan": plan.toJson(),
      };
}

class Plan {
  final int id;
  final String label;
  final int price;
  final int adLimit;
  final int featuredLimit;
  final int businessDirectoryLimit;
  final int eventLimit;
  final bool badge;
  final int recommended;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String interval;
  final int customIntervalDays;

  Plan({
    required this.id,
    required this.label,
    required this.price,
    required this.adLimit,
    required this.featuredLimit,
    required this.businessDirectoryLimit,
    required this.eventLimit,
    required this.badge,
    required this.recommended,
    required this.createdAt,
    required this.updatedAt,
    required this.interval,
    required this.customIntervalDays,
  });

  factory Plan.fromRawJson(String str) => Plan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        label: json["label"],
        price: json["price"],
        adLimit: json["ad_limit"],
        featuredLimit: json["featured_limit"],
        businessDirectoryLimit: json["business_directory_limit"],
        eventLimit: json["event_limit"],
        badge: json["badge"],
        recommended: json["recommended"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        interval: json["interval"],
        customIntervalDays: json["custom_interval_days"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "price": price,
        "ad_limit": adLimit,
        "featured_limit": featuredLimit,
        "business_directory_limit": businessDirectoryLimit,
        "event_limit": eventLimit,
        "badge": badge,
        "recommended": recommended,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "interval": interval,
        "custom_interval_days": customIntervalDays,
      };
}
