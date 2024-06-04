import 'dart:convert';

import 'package:classified_apps/apps/views/home/models/category_model.dart';
import 'package:classified_apps/apps/views/home/models/customer_model.dart';

class AdsModel {
  final int id;
  final String title;
  final String slug;
  final String thumbnail;
  final String price;
  final int userId;
  final int featured;
  // final dynamic region;
  final String city;
  final dynamic country;
  final String? countryCode;
  // final int totalViews;
  bool isWishlist;
  // final String address;
  final Category? category;
  final Customer? customer;
  final String createdAt;

  AdsModel(
      {required this.id,
        required this.userId,
        required this.title,
        required this.slug,
        required this.thumbnail,
        required this.price,
        required this.featured,
        // required this.region,
        required this.country,
        required this.countryCode,
        // required this.address,
        // required this.totalViews,
        this.category,
        this.customer,
        required this.createdAt,
        required this.city,
        required this.isWishlist});

  factory AdsModel.fromJson(String str) => AdsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdsModel.fromMap(Map<String, dynamic> json) => AdsModel(
      id: json["id"],
      userId: json["user_id"] ?? 0,
      title: json["title"] ?? "",
      slug: json["slug"] ?? "",
      thumbnail: json["thumbnail"] ?? "",
      price: json["price"] == null ? "0.00" : double.parse(json["price"].toString()).toStringAsFixed(2),
      featured: json["featured"],
      // region: json["region"],
      country: json["country"],
      countryCode: json["country_code"],
      // address: json["address"] ?? "",
      // totalViews: json["total_views"] ?? 0,
      category:
      json["category"] == null ? null : Category.fromMap(json["category"]),
      customer:
      json["customer"] == null ? null : Customer.fromMap(json["customer"]),
      createdAt: json["created_at"] ?? "",
      city: json["city"] ?? "",
      isWishlist: json['wishlisted'] ?? false);

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "slug": slug,
    "thumbnail": thumbnail,
    "price": price,
    "featured": featured,
    // "region": region,
    "country": country,
    "country_code": countryCode,
    // "address": address,
    // "total_views": totalViews,
    "category": category?.toMap(),
    "customer": customer!.toMap(),
    "created_at": createdAt,
    "city": city,
    "wishlisted": isWishlist,
  };
}
