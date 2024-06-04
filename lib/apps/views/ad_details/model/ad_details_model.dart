import 'dart:convert';

import 'package:classified_apps/apps/views/home/models/ad_model.dart';
import 'package:classified_apps/apps/views/home/models/category_model.dart';
import 'package:classified_apps/apps/views/home/models/customer_model.dart';
import 'package:classified_apps/apps/views/home/models/sub_category_model.dart';

class AdDetailsModel {
  final AdDetails adDetails;
  final List<AdsModel> relatedAds;
  final RatingDetails ratingDetails;

  AdDetailsModel({
    required this.adDetails,
    required this.relatedAds,
    required this.ratingDetails,
  });

  factory AdDetailsModel.fromJson(String str) =>
      AdDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdDetailsModel.fromMap(Map<String, dynamic> json) => AdDetailsModel(
        adDetails: AdDetails.fromMap(json["ad_details"]),
        relatedAds: List<AdsModel>.from(
            json["related_ads"].map((x) => AdsModel.fromMap(x))),
        ratingDetails: RatingDetails.fromJson(json["rating_details"]),
      );

  Map<String, dynamic> toMap() => {
        "ad_details": adDetails.toMap(),
        "related_ads": List<dynamic>.from(relatedAds.map((x) => x.toMap())),
      };
}

class AdDetails {
  final int id;
  final String title;
  final String slug;
  final int userId;
  final int categoryId;
  final int subcategoryId;
  final dynamic brandId;
  final dynamic brandName;
  final dynamic price;
  final String description;
  final String phone;
  final bool showPhone;
  final int showEmail;
  final int showWhatsApp;
  final int receivedIsEmail;
  final int receivedIsPhone;
  final String email;
  final dynamic phone2;
  final String thumbnail;
  final String status;
  final int featured;
  final String isFeatured;
  final int totalReports;
  final int totalViews;
  final int isBlocked;
  final dynamic draftedAt;
  final String createdAt;
  final String updatedAt;
  final String address;
  final dynamic neighborhood;
  final dynamic locality;
  final dynamic place;
  final dynamic district;
  final dynamic postcode;
  final dynamic region;
  final dynamic country;
  final dynamic long;
  final dynamic lat;
  final String whatsapp;
  final dynamic serviceTypeId;
  final dynamic designationId;
  final dynamic productModelId;
  final dynamic experience;
  final dynamic educations;
  final dynamic salaryFrom;
  final dynamic salaryTo;
  final dynamic deadline;
  final dynamic employerName;
  final String condition;
  final dynamic authenticity;
  final dynamic ram;
  final dynamic edition;
  final dynamic processor;
  final dynamic trimEdition;
  final dynamic yearOfManufacture;
  final dynamic engineCapacity;
  final dynamic transmission;
  final dynamic registrationYear;
  final dynamic bodyType;
  final dynamic fuelType;
  final dynamic propertyType;
  final String size;
  final dynamic sizeType;
  final dynamic propertyLocation;
  final dynamic priceType;
  final dynamic animalType;
  final dynamic employerLogo;
  final dynamic employerWebsite;
  final dynamic employmentType;
  final dynamic bedroom;
  final String imageUrl;
  final Category? category;
  final Subcategory? subcategory;
  final dynamic model;
  final dynamic designation;
  final dynamic serviceType;
  final Customer customer;
  final dynamic brand;
  final List<AdFeature> adFeatures;
  final List<Gallery> galleries;

  AdDetails({
    required this.id,
    required this.title,
    required this.slug,
    required this.userId,
    required this.categoryId,
    required this.subcategoryId,
    required this.brandId,
    required this.brandName,
    required this.price,
    required this.description,
    required this.phone,
    required this.showPhone,
    required this.showEmail,
    required this.showWhatsApp,
    required this.receivedIsEmail,
    required this.receivedIsPhone,
    required this.email,
    required this.phone2,
    required this.thumbnail,
    required this.status,
    required this.featured,
    required this.isFeatured,
    required this.totalReports,
    required this.totalViews,
    required this.isBlocked,
    required this.draftedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.address,
    required this.neighborhood,
    required this.locality,
    required this.place,
    required this.district,
    required this.postcode,
    required this.region,
    required this.country,
    required this.long,
    required this.lat,
    required this.whatsapp,
    required this.serviceTypeId,
    required this.designationId,
    required this.productModelId,
    required this.experience,
    required this.educations,
    required this.salaryFrom,
    required this.salaryTo,
    required this.deadline,
    required this.employerName,
    required this.condition,
    required this.authenticity,
    required this.ram,
    required this.edition,
    required this.processor,
    required this.trimEdition,
    required this.yearOfManufacture,
    required this.engineCapacity,
    required this.transmission,
    required this.registrationYear,
    required this.bodyType,
    required this.fuelType,
    required this.propertyType,
    required this.size,
    required this.sizeType,
    required this.propertyLocation,
    required this.priceType,
    required this.animalType,
    required this.employerLogo,
    required this.employerWebsite,
    required this.employmentType,
    required this.bedroom,
    required this.imageUrl,
    required this.category,
    required this.subcategory,
    required this.model,
    required this.designation,
    required this.serviceType,
    required this.customer,
    required this.brand,
    required this.adFeatures,
    required this.galleries,
  });

  factory AdDetails.fromJson(String str) => AdDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdDetails.fromMap(Map<String, dynamic> json) => AdDetails(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        slug: json["slug"] ?? "",
        userId: json["user_id"] ?? 0,
        categoryId: json["category_id"] ?? 0,
        subcategoryId: json["subcategory_id"] ?? 0,
        brandId: json["brand_id"],
        brandName: json["brand_name"],
        price: json["price"],
        description: json["description"] ?? "",
        phone: json["phone"] ?? "",
        showPhone: json["show_phone"] ?? false,
        showEmail: json["show_email"] ?? 0,
    showWhatsApp: json["show_whatsapp"] ?? 0,
    receivedIsEmail: json["received_email"] ?? 0,
    receivedIsPhone: json["received_phone"] ?? 0,
        email: json["email"] ?? "",
        phone2: json["phone_2"],
        thumbnail: json["thumbnail"] ?? "",
        status: json["status"] ?? "",
        featured: json["featured"] ?? 0,
        isFeatured: json["is_featured"] ?? "",
        totalReports: json["total_reports"] ?? 0,
        totalViews: json["total_views"] ?? 0,
        isBlocked: json["is_blocked"] ?? 0,
        draftedAt: json["drafted_at"],
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
        address: json["address"] ?? "",
        neighborhood: json["neighborhood"],
        locality: json["locality"],
        place: json["place"],
        district: json["district"],
        postcode: json["postcode"],
        region: json["region"],
        country: json["country"],
        long: json["long"],
        lat: json["lat"],
        whatsapp: json["whatsapp"] ?? "",
        serviceTypeId: json["service_type_id"],
        designationId: json["designation_id"],
        productModelId: json["product_model_id"],
        experience: json["experience"],
        educations: json["educations"],
        salaryFrom: json["salary_from"],
        salaryTo: json["salary_to"],
        deadline: json["deadline"],
        employerName: json["employer_name"],
        condition: json["condition"] ?? "",
        authenticity: json["authenticity"],
        ram: json["ram"],
        edition: json["edition"],
        processor: json["processor"],
        trimEdition: json["trim_edition"],
        yearOfManufacture: json["year_of_manufacture"],
        engineCapacity: json["engine_capacity"],
        transmission: json["transmission"],
        registrationYear: json["registration_year"],
        bodyType: json["body_type"],
        fuelType: json["fuel_type"],
        propertyType: json["property_type"],
        size: json["size"] ?? "",
        sizeType: json["size_type"],
        propertyLocation: json["property_location"],
        priceType: json["price_type"],
        animalType: json["animal_type"],
        employerLogo: json["employer_logo"],
        employerWebsite: json["employer_website"],
        employmentType: json["employment_type"],
        bedroom: json["bedroom"],
        imageUrl: json["image_url"] ?? "",
        category: json["category"] == null
            ? null
            : Category.fromMap(json["category"]),
        subcategory: json["subcategory"] == null
            ? null
            : Subcategory.fromMap(json["subcategory"]),
        model: json["model"],
        designation: json["designation"],
        serviceType: json["service_type"],
        customer: Customer.fromMap(json["customer"]),
        brand: json["brand"],
        // adFeatures: List<AdFeature>.from(json["ad_features"].map((x) => x)),
        adFeatures: json["ad_features"] == null || json["ad_features"] == []
            ? []
            : List<AdFeature>.from(
                json["ad_features"].map((x) => AdFeature.fromMap(x))),
        galleries: json["galleries"] == null || json["galleries"] == []
            ? []
            : List<Gallery>.from(
                json["galleries"].map((x) => Gallery.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "slug": slug,
        "user_id": userId,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "brand_id": brandId,
        "brand_name": brandName,
        "price": price,
        "description": description,
        "phone": phone,
        "show_phone": showPhone,
        "show_email": showEmail,
        "show_whatsapp": showWhatsApp,
        "received_email": receivedIsEmail,
        "received_phone": receivedIsPhone,
        "email": email,
        "phone_2": phone2,
        "thumbnail": thumbnail,
        "status": status,
        "featured": featured,
        "is_featured": isFeatured,
        "total_reports": totalReports,
        "total_views": totalViews,
        "is_blocked": isBlocked,
        "drafted_at": draftedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "address": address,
        "neighborhood": neighborhood,
        "locality": locality,
        "place": place,
        "district": district,
        "postcode": postcode,
        "region": region,
        "country": country,
        "long": long,
        "lat": lat,
        "whatsapp": whatsapp,
        "service_type_id": serviceTypeId,
        "designation_id": designationId,
        "product_model_id": productModelId,
        "experience": experience,
        "educations": educations,
        "salary_from": salaryFrom,
        "salary_to": salaryTo,
        "deadline": deadline,
        "employer_name": employerName,
        "condition": condition,
        "authenticity": authenticity,
        "ram": ram,
        "edition": edition,
        "processor": processor,
        "trim_edition": trimEdition,
        "year_of_manufacture": yearOfManufacture,
        "engine_capacity": engineCapacity,
        "transmission": transmission,
        "registration_year": registrationYear,
        "body_type": bodyType,
        "fuel_type": fuelType,
        "property_type": propertyType,
        "size": size,
        "size_type": sizeType,
        "property_location": propertyLocation,
        "price_type": priceType,
        "animal_type": animalType,
        "employer_logo": employerLogo,
        "employer_website": employerWebsite,
        "employment_type": employmentType,
        "bedroom": bedroom,
        "image_url": imageUrl,
        "model": model,
        "designation": designation,
        "service_type": serviceType,
        "customer": customer.toMap(),
        "brand": brand,
        "ad_features": List<dynamic>.from(adFeatures.map((x) => x)),
        "galleries": List<dynamic>.from(galleries.map((x) => x)),
      };
}

class AdFeature {
  final int id;
  final int adId;
  final String name;
  final String createdAt;
  final String updatedAt;

  AdFeature({
    required this.id,
    required this.adId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdFeature.fromJson(String str) => AdFeature.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdFeature.fromMap(Map<String, dynamic> json) => AdFeature(
        id: json["id"],
        adId: json["ad_id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "ad_id": adId,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Gallery {
  final int id;
  final int adId;
  final String image;
  final String createdAt;
  final String updatedAt;
  final String imageUrl;

  Gallery({
    required this.id,
    required this.adId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  factory Gallery.fromJson(String str) => Gallery.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Gallery.fromMap(Map<String, dynamic> json) => Gallery(
        id: json["id"],
        adId: json["ad_id"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "ad_id": adId,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "image_url": imageUrl,
      };
}

class RatingDetails {
  final int total;
  final String rating;
  final String average;

  RatingDetails({
    required this.total,
    required this.rating,
    required this.average,
  });

  factory RatingDetails.fromJson(Map<String, dynamic> json) => RatingDetails(
        total: json["total"] ?? 0,
        rating: json["rating"] ?? '',
        average: json["average"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "rating": rating,
        "average": average,
      };
}
