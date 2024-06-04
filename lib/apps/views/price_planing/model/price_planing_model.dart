class PricePlaningModel {
  final int status;
  final bool success;
  final int code;
  final String message;
  final dynamic description;
  final List<Datum> data;

  PricePlaningModel({
    required this.status,
    required this.success,
    required this.code,
    required this.message,
    required this.description,
    required this.data,
  });

  factory PricePlaningModel.fromJson(Map<String, dynamic> json) => PricePlaningModel(
    status: json["status"],
    success: json["success"],
    code: json["code"],
    message: json["message"],
    description: json["description"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "code": code,
    "message": message,
    "description": description,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final int id;
  final String label;
  final int price;
  final int adLimit;
  final int featuredLimit;
  final bool badge;
  final int recommended;
  final int businessDirectoryLimit;
  final int eventLimit;
  final String cashPayment;

  Datum({
    required this.id,
    required this.label,
    required this.price,
    required this.adLimit,
    required this.featuredLimit,
    required this.badge,
    required this.recommended,
    required this.businessDirectoryLimit,
    required this.eventLimit,
    required this.cashPayment,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    label: json["label"],
    price: json["price"],
    adLimit: json["ad_limit"],
    featuredLimit: json["featured_limit"],
    badge: json["badge"],
    recommended: json["recommended"],
    businessDirectoryLimit: json["business_directory_limit"],
    eventLimit: json["event_limit"],
    cashPayment: json["cash_payment"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label": label,
    "price": price,
    "ad_limit": adLimit,
    "featured_limit": featuredLimit,
    "badge": badge,
    "recommended": recommended,
    "business_directory_limit": businessDirectoryLimit,
    "event_limit": eventLimit,
    "cash_payment": cashPayment,
  };
}
