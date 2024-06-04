class DashboardModel {
  final int status;
  final bool success;
  final int code;
  final String message;
  final Description description;
  final Data data;

  DashboardModel({
    required this.status,
    required this.success,
    required this.code,
    required this.message,
    required this.description,
    required this.data,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        status: json["status"],
        success: json["success"],
        code: json["code"],
        message: json["message"],
        description: Description.fromJson(json["description"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "code": code,
        "message": message,
        "description": description.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  final AdsCount adsCount;
  final Plan plan;
  final List<dynamic> actovityLog;
  final RecentAdd recentAdd;
  final int eventCount;
  final int businessDirectoryCount;
  final User user;

  Data({
    required this.adsCount,
    required this.plan,
    required this.actovityLog,
    required this.recentAdd,
    required this.eventCount,
    required this.businessDirectoryCount,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        adsCount: AdsCount.fromJson(json["ads_count"]),
        plan: Plan.fromJson(json["plan"]),
        actovityLog: List<dynamic>.from(json["actovity_log"].map((x) => x)),
        recentAdd: RecentAdd.fromJson(json["recentAdd"]),
        eventCount: json["event_count"],
        businessDirectoryCount: json["businessDirectory_count"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "ads_count": adsCount.toJson(),
        "plan": plan.toJson(),
        "actovity_log": List<dynamic>.from(actovityLog.map((x) => x)),
        "recentAdd": recentAdd.toJson(),
        "event_count": eventCount,
        "businessDirectory_count": businessDirectoryCount,
        "user": user.toJson(),
      };
}

class AdsCount {
  final int postedAdsCount;
  final int activeAdsCount;
  final int expireAdsCount;
  final int favouriteAdsCount;

  AdsCount({
    required this.postedAdsCount,
    required this.activeAdsCount,
    required this.expireAdsCount,
    required this.favouriteAdsCount,
  });

  factory AdsCount.fromJson(Map<String, dynamic> json) => AdsCount(
        postedAdsCount: json["posted_ads_count"],
        activeAdsCount: json["active_ads_count"],
        expireAdsCount: json["expire_ads_count"],
        favouriteAdsCount: json["favourite_ads_count"],
      );

  Map<String, dynamic> toJson() => {
        "posted_ads_count": postedAdsCount,
        "active_ads_count": activeAdsCount,
        "expire_ads_count": expireAdsCount,
        "favourite_ads_count": favouriteAdsCount,
      };
}

class Plan {
  final int adLimit;
  final int featuredLimit;
  final bool badge;
  final int eventLimit;
  final int businessDirectoryLimit;

  Plan({
    required this.adLimit,
    required this.featuredLimit,
    required this.badge,
    required this.eventLimit,
    required this.businessDirectoryLimit,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        adLimit: json["ad_limit"],
        featuredLimit: json["featured_limit"],
        badge: json["badge"],
        eventLimit: json["event_limit"],
        businessDirectoryLimit: json["business_directory_limit"],
      );

  Map<String, dynamic> toJson() => {
        "ad_limit": adLimit,
        "featured_limit": featuredLimit,
        "badge": badge,
        "event_limit": eventLimit,
        "business_directory_limit": businessDirectoryLimit,
      };
}

class RecentAdd {
  final int currentPage;
  final List<dynamic> data;
  final String firstPageUrl;
  final dynamic from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final dynamic nextPageUrl;
  final String path;
  final int perPage;
  final dynamic prevPageUrl;
  final dynamic to;
  final int total;

  RecentAdd({
    required this.currentPage,
    required this.data,
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

  factory RecentAdd.fromJson(Map<String, dynamic> json) => RecentAdd(
        currentPage: json["current_page"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x)),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Link {
  final String? url;
  final String label;
  final bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class User {
  final String image;
  final String name;
  final String imageUrl;
  final int unread;

  User({
    required this.image,
    required this.name,
    required this.imageUrl,
    required this.unread,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        image: json["image"],
        name: json["name"],
        imageUrl: json["image_url"],
        unread: json["unread"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "image_url": imageUrl,
        "unread": unread,
      };
}

class Description {
  final String paginate;

  Description({
    required this.paginate,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        paginate: json["paginate"],
      );

  Map<String, dynamic> toJson() => {
        "paginate": paginate,
      };
}
