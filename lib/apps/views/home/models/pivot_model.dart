import 'dart:convert';

class Pivot {
  final int categoryId;
  final int customFieldId;
  final int order;

  Pivot({
    required this.categoryId,
    required this.customFieldId,
    required this.order,
  });

  factory Pivot.fromJson(String str) => Pivot.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pivot.fromMap(Map<String, dynamic> json) => Pivot(
    categoryId: json["category_id"],
    customFieldId: json["custom_field_id"],
    order: json["order"],
  );

  Map<String, dynamic> toMap() => {
    "category_id": categoryId,
    "custom_field_id": customFieldId,
    "order": order,
  };
}
