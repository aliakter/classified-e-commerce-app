import 'dart:convert';

import 'package:classified_apps/apps/views/home/models/ad_model.dart';

class AdListResponseModel {
  final int currentPage;
  final List<AdsModel> adsList;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final dynamic nextPageUrl;
  final String path;
  final String perPage;
  final dynamic prevPageUrl;
  final int to;
  final int total;

  AdListResponseModel({
    required this.currentPage,
    required this.adsList,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory AdListResponseModel.fromJson(String str) => AdListResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdListResponseModel.fromMap(Map<String, dynamic> json) => AdListResponseModel(
    currentPage: json["current_page"]??0,
    adsList: List<AdsModel>.from(json["data"].map((x) => AdsModel.fromMap(x))),
    firstPageUrl: json["first_page_url"]??"",
    from: json["from"]??0,
    lastPage: json["last_page"]??0,
    lastPageUrl: json["last_page_url"]??"",
    links: List<Link>.from(json["links"].map((x) => Link.fromMap(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"]??"",
    perPage: json["per_page"]??"",
    prevPageUrl: json["prev_page_url"],
    to: json["to"]??0,
    total: json["total"]??0,
  );

  Map<String, dynamic> toMap() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(adsList.map((x) => x.toMap())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links.map((x) => x.toMap())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class CustomField {
  final int id;
  final int customFieldGroupId;
  final String name;
  final String slug;
  final String type;
  final int required;
  final int filterable;
  final int listable;
  final String icon;
  final int order;
  final String createdAt;
  final String updatedAt;
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

  factory CustomField.fromJson(String str) => CustomField.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomField.fromMap(Map<String, dynamic> json) => CustomField(
    id: json["id"],
    customFieldGroupId: json["custom_field_group_id"],
    name: json["name"]??"",
    slug: json["slug"]??"",
    type: json["type"]??"",
    required: json["required"],
    filterable: json["filterable"],
    listable: json["listable"],
    icon: json["icon"]??"",
    order: json["order"],
    createdAt: json["created_at"]??"",
    updatedAt: json["updated_at"]??"",
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
    categoryId: json["category_id"]??0,
    customFieldId: json["custom_field_id"]??0,
    order: json["order"]??0,
  );

  Map<String, dynamic> toMap() => {
    "category_id": categoryId,
    "custom_field_id": customFieldId,
    "order": order,
  };
}

class Link {
  final String url;
  final String label;
  final bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Link.fromMap(Map<String, dynamic> json) => Link(
    url: json["url"]??"",
    label: json["label"]??"",
    active: json["active"]??false,
  );

  Map<String, dynamic> toMap() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
