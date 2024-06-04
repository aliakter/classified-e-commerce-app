import 'dart:convert';

class ServiceTypeModel {
  final int id;
  final String name;
  final String slug;
  final int status;
  final String createdAt;
  final String updatedAt;

  ServiceTypeModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ServiceTypeModel.fromJson(String str) => ServiceTypeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceTypeModel.fromMap(Map<String, dynamic> json) => ServiceTypeModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "slug": slug,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
