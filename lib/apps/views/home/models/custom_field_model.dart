
import 'dart:convert';

import 'package:classified_apps/apps/views/home/models/pivot_model.dart';

import '../../ad_details/model/ad_details_model.dart';

class CustomField {
  final int id;
  final int customFieldGroupId;
  final String name;
  final String slug;
  final Type type;
  final int required;
  final int filterable;
  final int listable;
  final String icon;
  final int order;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Pivot pivot;

  CustomField({
    required this.id,
    required this.customFieldGroupId,
    required this.name,
    required this.slug,
    required this.type,
    required this.required,
    required this.filterable,
    required this.listable,
    required this.icon,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory CustomField.fromRawJson(String str) => CustomField.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  factory CustomField.fromMap(Map<String, dynamic> json) => CustomField(
    id: json["id"],
    customFieldGroupId: json["custom_field_group_id"],
    name: json["name"],
    slug: json["slug"],
    type: json["type"],
    required: json["required"],
    filterable: json["filterable"],
    listable: json["listable"],
    icon: json["icon"],
    order: json["order"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromMap(json["pivot"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "custom_field_group_id": customFieldGroupId,
    "name": name,
    "slug": slug,
    "type": type,
    "required": required,
    "filterable": filterable,
    "listable": listable,
    "icon": icon,
    "order": order,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "pivot": pivot.toMap(),
  };
}