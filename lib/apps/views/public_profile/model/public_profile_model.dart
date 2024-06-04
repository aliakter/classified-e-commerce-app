import 'dart:convert';

import 'package:classified_apps/apps/views/home/models/ad_model.dart';
import 'package:classified_apps/apps/views/home/models/customer_model.dart';

class PublicProfileModel {
  final RatingDetails ratingDetails;
  final List<Review> reviews;
  final List<AdsModel> recentAds;
  final int totalActiveAd;
  final List<dynamic> socialMedias;
  final Customer user;

  PublicProfileModel({
    required this.ratingDetails,
    required this.reviews,
    required this.recentAds,
    required this.totalActiveAd,
    required this.socialMedias,
    required this.user,
  });

  factory PublicProfileModel.fromJson(String str) => PublicProfileModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PublicProfileModel.fromMap(Map<String, dynamic> json) => PublicProfileModel(
    ratingDetails: RatingDetails.fromMap(json["rating_details"]),
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromMap(x))),
    recentAds: List<AdsModel>.from(json["recent_ads"].map((x) => AdsModel.fromMap(x))),
    totalActiveAd: json["total_active_ad"],
    socialMedias: List<dynamic>.from(json["social_medias"].map((x) => x)),
    user: Customer.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => {
    "rating_details": ratingDetails.toMap(),
    "reviews": List<dynamic>.from(reviews.map((x) => x.toMap())),
    "recent_ads": List<dynamic>.from(recentAds.map((x) => x.toMap())),
    "total_active_ad": totalActiveAd,
    "social_medias": List<dynamic>.from(socialMedias.map((x) => x)),
    "user": user.toMap(),
  };
}

class RatingDetails {
  final int total;
  final int rating;
  final String average;

  RatingDetails({
    required this.total,
    required this.rating,
    required this.average,
  });

  factory RatingDetails.fromJson(String str) => RatingDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RatingDetails.fromMap(Map<String, dynamic> json) => RatingDetails(
    total: json["total"],
    rating: json["rating"],
    average: json["average"],
  );

  Map<String, dynamic> toMap() => {
    "total": total,
    "rating": rating,
    "average": average,
  };
}

class Review {
  final int id;
  final int sellerId;
  final int userId;
  final int stars;
  final String comment;
  final int status;
  final String createdAt;
  final String updatedAt;
  final Customer user;

  Review({
    required this.id,
    required this.sellerId,
    required this.userId,
    required this.stars,
    required this.comment,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Review.fromJson(String str) => Review.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Review.fromMap(Map<String, dynamic> json) => Review(
    id: json["id"],
    sellerId: json["seller_id"],
    userId: json["user_id"],
    stars: json["stars"],
    comment: json["comment"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    user: Customer.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "seller_id": sellerId,
    "user_id": userId,
    "stars": stars,
    "comment": comment,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "user": user.toMap(),
  };
}
