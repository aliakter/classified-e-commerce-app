import 'dart:convert';

class Subcategory {
  final int id;
  final int categoryId;
  final String name;
  final String slug;
  final int status;
  final String createdAt;
  final String updatedAt;
  final int type;

  Subcategory({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.slug,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
  });

  factory Subcategory.fromJson(String str) => Subcategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Subcategory.fromMap(Map<String, dynamic> json) => Subcategory(
    id: json["id"]??0,
    categoryId: json["category_id"]??0,
    name: json["name"]??'',
    slug: json["slug"]??"",
    status: json["status"]??0,
    createdAt: json["created_at"]??"",
    updatedAt: json["updated_at"]??"",
    type: json["type"]??0,
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "category_id": categoryId,
    "name": name,
    "slug": slug,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "type": type,
  };
}