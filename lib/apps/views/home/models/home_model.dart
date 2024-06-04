import 'package:classified_apps/apps/views/home/models/ad_model.dart';
import 'package:classified_apps/apps/views/home/models/brand_model.dart';
import 'package:classified_apps/apps/views/home/models/category_model.dart';
import 'package:classified_apps/apps/views/home/models/country_model.dart';
import 'dart:convert';

import 'package:classified_apps/apps/views/home/models/service_model.dart';

class HomeModel {
  final List<CountryModel> topCountry;
  final List<AdsModel> ads;
  final List<Category> categories;
  final List<BrandModel> brands;
  final List<ServiceTypeModel> serviceTypes;
  final List<ServiceTypeModel> designations;
  final List<AdsModel> featureAds;
  final List<AdsModel> latestAds;
  final int verifiedUsers;

  HomeModel({
    required this.topCountry,
    required this.ads,
    required this.categories,
    required this.brands,
    required this.serviceTypes,
    required this.designations,
    required this.featureAds,
    required this.latestAds,
    required this.verifiedUsers,
  });

  factory HomeModel.fromJson(String str) => HomeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HomeModel.fromMap(Map<String, dynamic> json) => HomeModel(
    topCountry: List<CountryModel>.from(json["topCountry"].map((x) => CountryModel.fromMap(x))),
    ads: List<AdsModel>.from(json["ads"].map((x) => AdsModel.fromMap(x))),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromMap(x))),
    brands: List<BrandModel>.from(json["brands"].map((x) => BrandModel.fromMap(x))),
    serviceTypes: List<ServiceTypeModel>.from(json["service_types"].map((x) => ServiceTypeModel.fromMap(x))),
    designations: List<ServiceTypeModel>.from(json["designations"].map((x) => ServiceTypeModel.fromMap(x))),
    featureAds: List<AdsModel>.from(json["featureAds"].map((x) => AdsModel.fromMap(x))),
    latestAds: List<AdsModel>.from(json["latestAds"].map((x) => AdsModel.fromMap(x))),
    verifiedUsers: json["verified_users"],
  );

  Map<String, dynamic> toMap() => {
    "topCountry": List<dynamic>.from(topCountry.map((x) => x.toMap())),
    "ads": List<dynamic>.from(ads.map((x) => x.toMap())),
    "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
    "brands": List<dynamic>.from(brands.map((x) => x.toMap())),
    "service_types": List<dynamic>.from(serviceTypes.map((x) => x.toMap())),
    "designations": List<dynamic>.from(designations.map((x) => x.toMap())),
    "featureAds": List<dynamic>.from(featureAds.map((x) => x.toMap())),
    "latestAds": List<dynamic>.from(latestAds.map((x) => x.toMap())),
    "verified_users": verifiedUsers,
  };
}
