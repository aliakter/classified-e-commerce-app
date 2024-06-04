import 'package:classified_apps/apps/views/home/models/ad_model.dart';

class WishlistModel {
  final int status;
  final bool success;
  final int code;
  final String message;
  final List<dynamic> description;
  final List<Datum> data;

  WishlistModel({
    required this.status,
    required this.success,
    required this.code,
    required this.message,
    required this.description,
    required this.data,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        status: json["status"],
        success: json["success"],
        code: json["code"],
        message: json["message"],
        description: List<dynamic>.from(json["description"].map((x) => x)),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "code": code,
        "message": message,
        "description": List<dynamic>.from(description.map((x) => x)),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int id;
  final int adId;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final AdsModel ad;

  Datum({
    required this.id,
    required this.adId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.ad,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        adId: json["ad_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        ad: AdsModel.fromMap(json["ad"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ad_id": adId,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "ad": ad.toMap(),
      };
}


// class Ad {
//   final int id;
//   final String title;
//   final String slug;
//   final int userId;
//   final int categoryId;
//   final int subcategoryId;
//   final dynamic brandId;
//   final dynamic brandName;
//   final int price;
//   final String description;
//   final String phone;
//   final bool showPhone;
//   final int showEmail;
//   final String email;
//   final dynamic phone2;
//   final String thumbnail;
//   final String status;
//   final int featured;
//   final String isFeatured;
//   final int totalReports;
//   final int totalViews;
//   final int isBlocked;
//   final dynamic draftedAt;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final String address;
//   final dynamic neighborhood;
//   final dynamic locality;
//   final dynamic place;
//   final dynamic district;
//   final dynamic postcode;
//   final dynamic region;
//   final dynamic country;
//   final dynamic long;
//   final dynamic lat;
//   final dynamic whatsapp;
//   final dynamic serviceTypeId;
//   final dynamic designationId;
//   final dynamic productModelId;
//   final dynamic experience;
//   final dynamic educations;
//   final dynamic salaryFrom;
//   final dynamic salaryTo;
//   final dynamic deadline;
//   final dynamic employerName;
//   final dynamic condition;
//   final dynamic authenticity;
//   final dynamic ram;
//   final dynamic edition;
//   final dynamic processor;
//   final dynamic trimEdition;
//   final dynamic yearOfManufacture;
//   final dynamic engineCapacity;
//   final dynamic transmission;
//   final dynamic registrationYear;
//   final dynamic bodyType;
//   final dynamic fuelType;
//   final dynamic propertyType;
//   final dynamic size;
//   final dynamic sizeType;
//   final dynamic propertyLocation;
//   final dynamic priceType;
//   final dynamic animalType;
//   final dynamic employerLogo;
//   final dynamic employerWebsite;
//   final dynamic employmentType;
//   final dynamic bedroom;
//   final String imageUrl;
//   final Category category;
//   final Subcategory subcategory;
//   final Customer customer;
//   final dynamic brand;
//   final List<AdFeature> adFeatures;
//   final List<dynamic> galleries;
//
//   Ad({
//     required this.id,
//     required this.title,
//     required this.slug,
//     required this.userId,
//     required this.categoryId,
//     required this.subcategoryId,
//     required this.brandId,
//     required this.brandName,
//     required this.price,
//     required this.description,
//     required this.phone,
//     required this.showPhone,
//     required this.showEmail,
//     required this.email,
//     required this.phone2,
//     required this.thumbnail,
//     required this.status,
//     required this.featured,
//     required this.isFeatured,
//     required this.totalReports,
//     required this.totalViews,
//     required this.isBlocked,
//     required this.draftedAt,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.address,
//     required this.neighborhood,
//     required this.locality,
//     required this.place,
//     required this.district,
//     required this.postcode,
//     required this.region,
//     required this.country,
//     required this.long,
//     required this.lat,
//     required this.whatsapp,
//     required this.serviceTypeId,
//     required this.designationId,
//     required this.productModelId,
//     required this.experience,
//     required this.educations,
//     required this.salaryFrom,
//     required this.salaryTo,
//     required this.deadline,
//     required this.employerName,
//     required this.condition,
//     required this.authenticity,
//     required this.ram,
//     required this.edition,
//     required this.processor,
//     required this.trimEdition,
//     required this.yearOfManufacture,
//     required this.engineCapacity,
//     required this.transmission,
//     required this.registrationYear,
//     required this.bodyType,
//     required this.fuelType,
//     required this.propertyType,
//     required this.size,
//     required this.sizeType,
//     required this.propertyLocation,
//     required this.priceType,
//     required this.animalType,
//     required this.employerLogo,
//     required this.employerWebsite,
//     required this.employmentType,
//     required this.bedroom,
//     required this.imageUrl,
//     required this.category,
//     required this.subcategory,
//     required this.customer,
//     required this.brand,
//     required this.adFeatures,
//     required this.galleries,
//   });
//
//   factory Ad.fromJson(Map<String, dynamic> json) => Ad(
//         id: json["id"],
//         title: json["title"],
//         slug: json["slug"],
//         userId: json["user_id"],
//         categoryId: json["category_id"],
//         subcategoryId: json["subcategory_id"],
//         brandId: json["brand_id"],
//         brandName: json["brand_name"],
//         price: json["price"] ?? 0,
//         description: json["description"],
//         phone: json["phone"],
//         showPhone: json["show_phone"],
//         showEmail: json["show_email"],
//         email: json["email"],
//         phone2: json["phone_2"],
//         thumbnail: json["thumbnail"],
//         status: json["status"],
//         featured: json["featured"],
//         isFeatured: json["is_featured"],
//         totalReports: json["total_reports"],
//         totalViews: json["total_views"],
//         isBlocked: json["is_blocked"],
//         draftedAt: json["drafted_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         address: json["address"],
//         neighborhood: json["neighborhood"],
//         locality: json["locality"],
//         place: json["place"],
//         district: json["district"],
//         postcode: json["postcode"],
//         region: json["region"],
//         country: json["country"],
//         long: json["long"],
//         lat: json["lat"],
//         whatsapp: json["whatsapp"],
//         serviceTypeId: json["service_type_id"],
//         designationId: json["designation_id"],
//         productModelId: json["product_model_id"],
//         experience: json["experience"],
//         educations: json["educations"],
//         salaryFrom: json["salary_from"],
//         salaryTo: json["salary_to"],
//         deadline: json["deadline"],
//         employerName: json["employer_name"],
//         condition: json["condition"],
//         authenticity: json["authenticity"],
//         ram: json["ram"],
//         edition: json["edition"],
//         processor: json["processor"],
//         trimEdition: json["trim_edition"],
//         yearOfManufacture: json["year_of_manufacture"],
//         engineCapacity: json["engine_capacity"],
//         transmission: json["transmission"],
//         registrationYear: json["registration_year"],
//         bodyType: json["body_type"],
//         fuelType: json["fuel_type"],
//         propertyType: json["property_type"],
//         size: json["size"],
//         sizeType: json["size_type"],
//         propertyLocation: json["property_location"],
//         priceType: json["price_type"],
//         animalType: json["animal_type"],
//         employerLogo: json["employer_logo"],
//         employerWebsite: json["employer_website"],
//         employmentType: json["employment_type"],
//         bedroom: json["bedroom"],
//         imageUrl: json["image_url"],
//         category: Category.fromJson(json["category"]),
//         subcategory: Subcategory.fromJson(json["subcategory"]),
//         customer: Customer.fromJson(json["customer"]),
//         brand: json["brand"],
//         adFeatures: List<AdFeature>.from(
//             json["ad_features"].map((x) => AdFeature.fromJson(x))),
//         galleries: List<dynamic>.from(json["galleries"].map((x) => x)),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "slug": slug,
//         "user_id": userId,
//         "category_id": categoryId,
//         "subcategory_id": subcategoryId,
//         "brand_id": brandId,
//         "brand_name": brandName,
//         "price": price,
//         "description": description,
//         "phone": phone,
//         "show_phone": showPhone,
//         "show_email": showEmail,
//         "email": email,
//         "phone_2": phone2,
//         "thumbnail": thumbnail,
//         "status": status,
//         "featured": featured,
//         "is_featured": isFeatured,
//         "total_reports": totalReports,
//         "total_views": totalViews,
//         "is_blocked": isBlocked,
//         "drafted_at": draftedAt,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "address": address,
//         "neighborhood": neighborhood,
//         "locality": locality,
//         "place": place,
//         "district": district,
//         "postcode": postcode,
//         "region": region,
//         "country": country,
//         "long": long,
//         "lat": lat,
//         "whatsapp": whatsapp,
//         "service_type_id": serviceTypeId,
//         "designation_id": designationId,
//         "product_model_id": productModelId,
//         "experience": experience,
//         "educations": educations,
//         "salary_from": salaryFrom,
//         "salary_to": salaryTo,
//         "deadline": deadline,
//         "employer_name": employerName,
//         "condition": condition,
//         "authenticity": authenticity,
//         "ram": ram,
//         "edition": edition,
//         "processor": processor,
//         "trim_edition": trimEdition,
//         "year_of_manufacture": yearOfManufacture,
//         "engine_capacity": engineCapacity,
//         "transmission": transmission,
//         "registration_year": registrationYear,
//         "body_type": bodyType,
//         "fuel_type": fuelType,
//         "property_type": propertyType,
//         "size": size,
//         "size_type": sizeType,
//         "property_location": propertyLocation,
//         "price_type": priceType,
//         "animal_type": animalType,
//         "employer_logo": employerLogo,
//         "employer_website": employerWebsite,
//         "employment_type": employmentType,
//         "bedroom": bedroom,
//         "image_url": imageUrl,
//         "category": category.toJson(),
//         "subcategory": subcategory.toJson(),
//         "customer": customer.toJson(),
//         "brand": brand,
//         "ad_features": List<dynamic>.from(adFeatures.map((x) => x.toJson())),
//         "galleries": List<dynamic>.from(galleries.map((x) => x)),
//       };
// }
//
// class AdFeature {
//   final int id;
//   final int adId;
//   final String name;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//
//   AdFeature({
//     required this.id,
//     required this.adId,
//     required this.name,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory AdFeature.fromJson(Map<String, dynamic> json) => AdFeature(
//         id: json["id"],
//         adId: json["ad_id"],
//         name: json["name"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "ad_id": adId,
//         "name": name,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
//
// class Category {
//   final int id;
//   final String name;
//   final String image;
//   final String slug;
//   final String icon;
//   final int order;
//   final int status;
//   final int isShowBrand;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final int type;
//   final String imageUrl;
//   final bool hasCustomField;
//   final List<dynamic> customFields;
//
//   Category({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.slug,
//     required this.icon,
//     required this.order,
//     required this.status,
//     required this.isShowBrand,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.type,
//     required this.imageUrl,
//     required this.hasCustomField,
//     required this.customFields,
//   });
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         name: json["name"],
//         image: json["image"],
//         slug: json["slug"],
//         icon: json["icon"],
//         order: json["order"],
//         status: json["status"],
//         isShowBrand: json["is_show_brand"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         type: json["type"],
//         imageUrl: json["image_url"],
//         hasCustomField: json["has_custom_field"],
//         customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "image": image,
//         "slug": slug,
//         "icon": icon,
//         "order": order,
//         "status": status,
//         "is_show_brand": isShowBrand,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "type": type,
//         "image_url": imageUrl,
//         "has_custom_field": hasCustomField,
//         "custom_fields": List<dynamic>.from(customFields.map((x) => x)),
//       };
// }
//
// class Customer {
//   final int id;
//   final String name;
//   final String username;
//   final String email;
//   final dynamic showEmail;
//   final int receiveEmail;
//   final dynamic phone;
//   final dynamic showPhone;
//   final dynamic emailVerifiedAt;
//   final dynamic web;
//   final String image;
//   final dynamic token;
//   final DateTime lastSeen;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final String authType;
//   final dynamic provider;
//   final dynamic providerId;
//   final int isSocialLogin;
//   final int socialToBusiness;
//   final dynamic fcmToken;
//   final dynamic aboutPublicProfile;
//   final dynamic openingHour;
//   final dynamic closingHours;
//   final String imageUrl;
//   final int unread;
//
//   Customer({
//     required this.id,
//     required this.name,
//     required this.username,
//     required this.email,
//     required this.showEmail,
//     required this.receiveEmail,
//     required this.phone,
//     required this.showPhone,
//     required this.emailVerifiedAt,
//     required this.web,
//     required this.image,
//     required this.token,
//     required this.lastSeen,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.authType,
//     required this.provider,
//     required this.providerId,
//     required this.isSocialLogin,
//     required this.socialToBusiness,
//     required this.fcmToken,
//     required this.aboutPublicProfile,
//     required this.openingHour,
//     required this.closingHours,
//     required this.imageUrl,
//     required this.unread,
//   });
//
//   factory Customer.fromJson(Map<String, dynamic> json) => Customer(
//         id: json["id"],
//         name: json["name"],
//         username: json["username"],
//         email: json["email"],
//         showEmail: json["show_email"],
//         receiveEmail: json["receive_email"],
//         phone: json["phone"],
//         showPhone: json["show_phone"],
//         emailVerifiedAt: json["email_verified_at"],
//         web: json["web"],
//         image: json["image"],
//         token: json["token"],
//         lastSeen: DateTime.parse(json["last_seen"]),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         authType: json["auth_type"],
//         provider: json["provider"],
//         providerId: json["provider_id"],
//         isSocialLogin: json["is_social_login"],
//         socialToBusiness: json["social_to_business"],
//         fcmToken: json["fcm_token"],
//         aboutPublicProfile: json["about_public_profile"],
//         openingHour: json["opening_hour"],
//         closingHours: json["closing_hours"],
//         imageUrl: json["image_url"],
//         unread: json["unread"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "username": username,
//         "email": email,
//         "show_email": showEmail,
//         "receive_email": receiveEmail,
//         "phone": phone,
//         "show_phone": showPhone,
//         "email_verified_at": emailVerifiedAt,
//         "web": web,
//         "image": image,
//         "token": token,
//         "last_seen": lastSeen.toIso8601String(),
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "auth_type": authType,
//         "provider": provider,
//         "provider_id": providerId,
//         "is_social_login": isSocialLogin,
//         "social_to_business": socialToBusiness,
//         "fcm_token": fcmToken,
//         "about_public_profile": aboutPublicProfile,
//         "opening_hour": openingHour,
//         "closing_hours": closingHours,
//         "image_url": imageUrl,
//         "unread": unread,
//       };
// }
//
// class Subcategory {
//   final int id;
//   final int categoryId;
//   final String name;
//   final String slug;
//   final int status;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final int type;
//
//   Subcategory({
//     required this.id,
//     required this.categoryId,
//     required this.name,
//     required this.slug,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.type,
//   });
//
//   factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
//         id: json["id"],
//         categoryId: json["category_id"],
//         name: json["name"],
//         slug: json["slug"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         type: json["type"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "category_id": categoryId,
//         "name": name,
//         "slug": slug,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "type": type,
//       };
// }
