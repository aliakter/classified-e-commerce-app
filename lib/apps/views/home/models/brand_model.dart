import 'dart:convert';

class BrandModel {
  final int id;
  final int categoryId;
  final String name;
  final String slug;
  final String createdAt;
  final String updatedAt;
  final List<Model> models;

  BrandModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.models,
  });

  factory BrandModel.fromJson(String str) => BrandModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BrandModel.fromMap(Map<String, dynamic> json) => BrandModel(
    id: json["id"],
    categoryId: json["category_id"],
    name: json["name"]??"",
    slug: json["slug"]??"",
    createdAt: json["created_at"]??"",
    updatedAt: json["updated_at"]??"",
    models: List<Model>.from(json["models"].map((x) => Model.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "category_id": categoryId,
    "name": name,
    "slug": slug,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "models": List<dynamic>.from(models.map((x) => x.toMap())),
  };
}

class Model {
  final int id;
  final int brandId;
  final String name;
  final String slug;
  final int status;
  final String createdAt;
  final String updatedAt;

  Model({
    required this.id,
    required this.brandId,
    required this.name,
    required this.slug,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Model.fromJson(String str) => Model.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Model.fromMap(Map<String, dynamic> json) => Model(
    id: json["id"],
    brandId: json["brand_id"],
    name: json["name"]??"",
    slug: json["slug"]??"",
    status: json["status"],
    createdAt: json["created_at"]??"",
    updatedAt: json["updated_at"]??"",
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "brand_id": brandId,
    "name": name,
    "slug": slug,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
