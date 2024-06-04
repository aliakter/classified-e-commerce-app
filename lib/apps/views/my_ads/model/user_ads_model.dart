class UserAdModel {
  int status;
  bool success;
  int code;
  String message;
  Data data;

  UserAdModel({
    required this.status,
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });

  factory UserAdModel.fromJson(Map<String, dynamic> json) => UserAdModel(
        status: json["status"],
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int? from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  String perPage;
  dynamic prevPageUrl;
  int? to;
  int total;

  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  int id;
  String title;
  String slug;
  int userId;
  int categoryId;
  int subcategoryId;
  dynamic brandId;
  dynamic brandName;
  dynamic price;
  String description;
  String phone;
  bool showPhone;
  int showEmail;
  dynamic email;
  dynamic phone2;
  String thumbnail;
  String status;
  int featured;
  String isFeatured;
  int totalReports;
  int totalViews;
  int isBlocked;
  dynamic draftedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String address;
  dynamic neighborhood;
  dynamic locality;
  dynamic place;
  dynamic district;
  dynamic postcode;
  dynamic region;
  dynamic country;
  dynamic long;
  dynamic lat;
  String whatsapp;
  dynamic serviceTypeId;
  dynamic designationId;
  dynamic productModelId;
  dynamic experience;
  dynamic educations;
  dynamic salaryFrom;
  dynamic salaryTo;
  dynamic deadline;
  dynamic employerName;
  dynamic condition;
  dynamic authenticity;
  dynamic ram;
  dynamic edition;
  dynamic processor;
  dynamic trimEdition;
  dynamic yearOfManufacture;
  dynamic engineCapacity;
  dynamic transmission;
  dynamic registrationYear;
  dynamic bodyType;
  List<String>? fuelType;
  dynamic propertyType;
  dynamic size;
  dynamic sizeType;
  dynamic propertyLocation;
  dynamic priceType;
  dynamic animalType;
  dynamic employerLogo;
  dynamic employerWebsite;
  dynamic employmentType;
  dynamic bedroom;
  String imageUrl;
  Category category;
  dynamic subcategory;
  Customer customer;
  dynamic brand;
  List<AdFeature> adFeatures;
  List<Gallery> galleries;
  List<dynamic> productCustomFields;

  Datum({
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
    this.fuelType,
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
    required this.customer,
    required this.brand,
    required this.adFeatures,
    required this.galleries,
    required this.productCustomFields,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? 0,
        title: json["title"],
        slug: json["slug"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"] ?? 0,
        brandId: json["brand_id"],
        brandName: json["brand_name"],
        price: json["price"],
        description: json["description"],
        phone: json["phone"]??"",
        showPhone: json["show_phone"],
        showEmail: json["show_email"],
        email: json["email"],
        phone2: json["phone_2"],
        thumbnail: json["thumbnail"] ?? "",
        status: json["status"],
        featured: json["featured"],
        isFeatured: json["is_featured"],
        totalReports: json["total_reports"],
        totalViews: json["total_views"],
        isBlocked: json["is_blocked"],
        draftedAt: json["drafted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        address: json["address"] ?? '',
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
        condition: json["condition"],
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
        fuelType: json["fuel_type"] == null
            ? null
            : List<String>.from(json["fuel_type"].map((x) => x)),
        propertyType: json["property_type"],
        size: json["size"],
        sizeType: json["size_type"],
        propertyLocation: json["property_location"],
        priceType: json["price_type"],
        animalType: json["animal_type"],
        employerLogo: json["employer_logo"],
        employerWebsite: json["employer_website"],
        employmentType: json["employment_type"],
        bedroom: json["bedroom"],
        imageUrl: json["image_url"],
        category: Category.fromJson(json["category"]),
        subcategory: json["subcategory"],
        customer: Customer.fromJson(json["customer"]),
        brand: json["brand"],
        adFeatures: List<AdFeature>.from(
            json["ad_features"].map((x) => AdFeature.fromJson(x))),
        galleries: List<Gallery>.from(
            json["galleries"].map((x) => Gallery.fromJson(x))),
        productCustomFields:
            List<dynamic>.from(json["product_custom_fields"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
        "fuel_type": List<dynamic>.from(fuelType!.map((x) => x)),
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
        "category": category.toJson(),
        "subcategory": subcategory,
        "customer": customer.toJson(),
        "brand": brand,
        "ad_features": List<dynamic>.from(adFeatures.map((x) => x.toJson())),
        "galleries": List<dynamic>.from(galleries.map((x) => x.toJson())),
        "product_custom_fields":
            List<dynamic>.from(productCustomFields.map((x) => x)),
      };
}

class AdFeature {
  int id;
  int adId;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  AdFeature({
    required this.id,
    required this.adId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdFeature.fromJson(Map<String, dynamic> json) => AdFeature(
        id: json["id"],
        adId: json["ad_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ad_id": adId,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Category {
  int id;
  String name;
  String image;
  String slug;
  String icon;
  int order;
  int status;
  int isShowBrand;
  DateTime createdAt;
  DateTime updatedAt;
  int type;
  String imageUrl;
  bool hasCustomField;
  List<CustomField> customFields;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
    required this.icon,
    required this.order,
    required this.status,
    required this.isShowBrand,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
    required this.imageUrl,
    required this.hasCustomField,
    required this.customFields,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        slug: json["slug"],
        icon: json["icon"],
        order: json["order"],
        status: json["status"],
        isShowBrand: json["is_show_brand"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        type: json["type"],
        imageUrl: json["image_url"],
        hasCustomField: json["has_custom_field"],
        customFields: List<CustomField>.from(
            json["custom_fields"].map((x) => CustomField.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "slug": slug,
        "icon": icon,
        "order": order,
        "status": status,
        "is_show_brand": isShowBrand,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "type": type,
        "image_url": imageUrl,
        "has_custom_field": hasCustomField,
        "custom_fields":
            List<dynamic>.from(customFields.map((x) => x.toJson())),
      };
}

class CustomField {
  int id;
  int customFieldGroupId;
  String name;
  String slug;
  int required;
  int filterable;
  int listable;
  String icon;
  int order;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  CustomField({
    required this.id,
    required this.customFieldGroupId,
    required this.name,
    required this.slug,
    required this.required,
    required this.filterable,
    required this.listable,
    required this.icon,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
        id: json["id"],
        customFieldGroupId: json["custom_field_group_id"],
        name: json["name"],
        slug: json["slug"],
        required: json["required"],
        filterable: json["filterable"],
        listable: json["listable"],
        icon: json["icon"],
        order: json["order"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "custom_field_group_id": customFieldGroupId,
        "name": name,
        "slug": slug,
        "required": required,
        "filterable": filterable,
        "listable": listable,
        "icon": icon,
        "order": order,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  int categoryId;
  int customFieldId;
  int order;

  Pivot({
    required this.categoryId,
    required this.customFieldId,
    required this.order,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        categoryId: json["category_id"],
        customFieldId: json["custom_field_id"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "custom_field_id": customFieldId,
        "order": order,
      };
}

class Customer {
  int id;
  String name;
  String username;
  String email;
  dynamic showEmail;
  int receiveEmail;
  dynamic phone;
  dynamic showPhone;
  dynamic emailVerifiedAt;
  dynamic web;
  String image;
  dynamic token;
  dynamic lastSeen;
  DateTime createdAt;
  DateTime updatedAt;
  String authType;
  dynamic provider;
  dynamic providerId;
  int isSocialLogin;
  int socialToBusiness;
  dynamic fcmToken;
  dynamic aboutPublicProfile;
  dynamic openingHour;
  dynamic closingHours;
  String imageUrl;
  int unread;

  Customer({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.showEmail,
    required this.receiveEmail,
    required this.phone,
    required this.showPhone,
    required this.emailVerifiedAt,
    required this.web,
    required this.image,
    required this.token,
    required this.lastSeen,
    required this.createdAt,
    required this.updatedAt,
    required this.authType,
    required this.provider,
    required this.providerId,
    required this.isSocialLogin,
    required this.socialToBusiness,
    required this.fcmToken,
    required this.aboutPublicProfile,
    required this.openingHour,
    required this.closingHours,
    required this.imageUrl,
    required this.unread,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        showEmail: json["show_email"],
        receiveEmail: json["receive_email"],
        phone: json["phone"],
        showPhone: json["show_phone"],
        emailVerifiedAt: json["email_verified_at"],
        web: json["web"],
        image: json["image"],
        token: json["token"],
        lastSeen: json["last_seen"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        authType: json["auth_type"],
        provider: json["provider"],
        providerId: json["provider_id"],
        isSocialLogin: json["is_social_login"],
        socialToBusiness: json["social_to_business"],
        fcmToken: json["fcm_token"],
        aboutPublicProfile: json["about_public_profile"],
        openingHour: json["opening_hour"],
        closingHours: json["closing_hours"],
        imageUrl: json["image_url"],
        unread: json["unread"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "show_email": showEmail,
        "receive_email": receiveEmail,
        "phone": phone,
        "show_phone": showPhone,
        "email_verified_at": emailVerifiedAt,
        "web": web,
        "image": image,
        "token": token,
        "last_seen": lastSeen,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "auth_type": authType,
        "provider": provider,
        "provider_id": providerId,
        "is_social_login": isSocialLogin,
        "social_to_business": socialToBusiness,
        "fcm_token": fcmToken,
        "about_public_profile": aboutPublicProfile,
        "opening_hour": openingHour,
        "closing_hours": closingHours,
        "image_url": imageUrl,
        "unread": unread,
      };
}

class Gallery {
  int id;
  int adId;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  String imageUrl;

  Gallery({
    required this.id,
    required this.adId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        id: json["id"],
        adId: json["ad_id"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ad_id": adId,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image_url": imageUrl,
      };
}
