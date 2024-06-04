import 'dart:convert';

SettingModel settingModelFromJson(String str) =>
    SettingModel.fromJson(json.decode(str));

String settingModelToJson(SettingModel data) => json.encode(data.toJson());

class SettingModel {
  int status;
  bool success;
  int code;
  String message;
  String description;
  Data data;

  SettingModel({
    required this.status,
    required this.success,
    required this.code,
    required this.message,
    required this.description,
    required this.data,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        status: json["status"],
        success: json["success"],
        code: json["code"],
        message: json["message"],
        description: json["description"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "code": code,
        "message": message,
        "description": description,
        "data": data.toJson(),
      };
}

class Data {
  int id;
  String logoImage;
  String whiteLogo;
  String faviconImage;
  dynamic headerCss;
  dynamic headerScript;
  dynamic bodyScript;
  int freeFeaturedAdLimit;
  int regularAdsHomepage;
  int featuredAdsHomepage;
  int customerEmailVerification;
  int maximumAdImageLimit;
  String subscriptionType;
  int adsAdminApproval;
  int freeAdLimit;
  int freeEventLimit;
  int freeBusinessDirectoryLimit;
  String sidebarColor;
  String navColor;
  String sidebarTxtColor;
  String navTxtColor;
  String mainColor;
  String accentColor;
  String frontendPrimaryColor;
  String frontendSecondaryColor;
  int darkMode;
  bool facebookPixel;
  bool googleAnalytics;
  bool searchEngineIndexing;
  int defaultLayout;
  int websiteLoader;
  String loaderImage;
  int languageChanging;
  int emailVerification;
  int watermarkStatus;
  String watermarkType;
  String watermarkText;
  String watermarkImage;
  DateTime createdAt;
  DateTime updatedAt;
  String defaultMap;
  String googleMapKey;
  String mapBoxKey;
  double defaultLong;
  double defaultLat;
  int pushNotificationStatus;
  String serverKey;
  String apiKey;
  String authDomain;
  String projectId;
  String storageBucket;
  String messagingSenderId;
  String appId;
  String measurementId;
  String facebook;
  String twitter;
  String instagram;
  String youtube;
  dynamic linkdin;
  String whatsapp;
  String fbAppId;
  String fbAccessToken;
  String cashPayment;
  dynamic topbarPhone;
  String currencyName;
  String currencyIcon;
  String appName;
  String appUrl;
  dynamic googleLogin;
  dynamic googleClientId;
  dynamic googleClientSecret;
  dynamic facebookLogin;
  dynamic facebookClientId;
  dynamic facebookClientSecret;
  String logoImageUrl;
  String whiteLogoUrl;
  String faviconImageUrl;
  String loaderImageUrl;

  Data({
    required this.id,
    required this.logoImage,
    required this.whiteLogo,
    required this.faviconImage,
    required this.headerCss,
    required this.headerScript,
    required this.bodyScript,
    required this.freeFeaturedAdLimit,
    required this.regularAdsHomepage,
    required this.featuredAdsHomepage,
    required this.customerEmailVerification,
    required this.maximumAdImageLimit,
    required this.subscriptionType,
    required this.adsAdminApproval,
    required this.freeAdLimit,
    required this.freeEventLimit,
    required this.freeBusinessDirectoryLimit,
    required this.sidebarColor,
    required this.navColor,
    required this.sidebarTxtColor,
    required this.navTxtColor,
    required this.mainColor,
    required this.accentColor,
    required this.frontendPrimaryColor,
    required this.frontendSecondaryColor,
    required this.darkMode,
    required this.facebookPixel,
    required this.googleAnalytics,
    required this.searchEngineIndexing,
    required this.defaultLayout,
    required this.websiteLoader,
    required this.loaderImage,
    required this.languageChanging,
    required this.emailVerification,
    required this.watermarkStatus,
    required this.watermarkType,
    required this.watermarkText,
    required this.watermarkImage,
    required this.createdAt,
    required this.updatedAt,
    required this.defaultMap,
    required this.googleMapKey,
    required this.mapBoxKey,
    required this.defaultLong,
    required this.defaultLat,
    required this.pushNotificationStatus,
    required this.serverKey,
    required this.apiKey,
    required this.authDomain,
    required this.projectId,
    required this.storageBucket,
    required this.messagingSenderId,
    required this.appId,
    required this.measurementId,
    required this.facebook,
    required this.twitter,
    required this.instagram,
    required this.youtube,
    required this.linkdin,
    required this.whatsapp,
    required this.fbAppId,
    required this.fbAccessToken,
    required this.cashPayment,
    required this.topbarPhone,
    required this.currencyName,
    required this.currencyIcon,
    required this.appName,
    required this.appUrl,
    required this.googleLogin,
    required this.googleClientId,
    required this.googleClientSecret,
    required this.facebookLogin,
    required this.facebookClientId,
    required this.facebookClientSecret,
    required this.logoImageUrl,
    required this.whiteLogoUrl,
    required this.faviconImageUrl,
    required this.loaderImageUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        logoImage: json["logo_image"] ?? '',
        whiteLogo: json["white_logo"] ?? '',
        faviconImage: json["favicon_image"] ?? '',
        headerCss: json["header_css"],
        headerScript: json["header_script"],
        bodyScript: json["body_script"],
        freeFeaturedAdLimit: json["free_featured_ad_limit"],
        regularAdsHomepage: json["regular_ads_homepage"],
        featuredAdsHomepage: json["featured_ads_homepage"],
        customerEmailVerification: json["customer_email_verification"],
        maximumAdImageLimit: json["maximum_ad_image_limit"],
        subscriptionType: json["subscription_type"] ?? '',
        adsAdminApproval: json["ads_admin_approval"],
        freeAdLimit: json["free_ad_limit"],
        freeEventLimit: json["free_event_limit"],
        freeBusinessDirectoryLimit: json["free_business_directory_limit"],
        sidebarColor: json["sidebar_color"] ?? '',
        navColor: json["nav_color"] ?? '',
        sidebarTxtColor: json["sidebar_txt_color"] ?? '',
        navTxtColor: json["nav_txt_color"],
        mainColor: json["main_color"],
        accentColor: json["accent_color"],
        frontendPrimaryColor: json["frontend_primary_color"],
        frontendSecondaryColor: json["frontend_secondary_color"],
        darkMode: json["dark_mode"],
        facebookPixel: json["facebook_pixel"],
        googleAnalytics: json["google_analytics"],
        searchEngineIndexing: json["search_engine_indexing"],
        defaultLayout: json["default_layout"],
        websiteLoader: json["website_loader"],
        loaderImage: json["loader_image"],
        languageChanging: json["language_changing"],
        emailVerification: json["email_verification"],
        watermarkStatus: json["watermark_status"],
        watermarkType: json["watermark_type"] ?? '',
        watermarkText: json["watermark_text"] ?? '',
        watermarkImage: json["watermark_image"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        defaultMap: json["default_map"] ?? '',
        googleMapKey: json["google_map_key"] ?? '',
        mapBoxKey: json["map_box_key"] ?? '',
        defaultLong: json["default_long"]?.toDouble(),
        defaultLat: json["default_lat"]?.toDouble(),
        pushNotificationStatus: json["push_notification_status"],
        serverKey: json["server_key"] ?? '',
        apiKey: json["api_key"] ?? '',
        authDomain: json["auth_domain"] ?? '',
        projectId: json["project_id"] ?? '',
        storageBucket: json["storage_bucket"] ?? '',
        messagingSenderId: json["messaging_sender_id"] ?? '',
        appId: json["app_id"] ?? '',
        measurementId: json["measurement_id"] ?? '',
        facebook: json["facebook"] ?? '',
        twitter: json["twitter"] ?? '',
        instagram: json["instagram"] ?? '',
        youtube: json["youtube"] ?? '',
        linkdin: json["linkdin"],
        whatsapp: json["whatsapp"] ?? '',
        fbAppId: json["fb_app_id"] ?? '',
        fbAccessToken: json["fb_access_token"] ?? '',
        cashPayment: json["cash_payment"] ?? '',
        topbarPhone: json["topbar_phone"],
        currencyName: json["currency_name"] ?? '',
        currencyIcon: json["currency_icon"] ?? '',
        appName: json["app_name"] ?? '',
        appUrl: json["app_url"] ?? '',
        googleLogin: json["google_login"],
        googleClientId: json["google_client_id"],
        googleClientSecret: json["google_client_secret"],
        facebookLogin: json["facebook_login"],
        facebookClientId: json["facebook_client_id"],
        facebookClientSecret: json["facebook_client_secret"],
        logoImageUrl: json["logo_image_url"] ?? '',
        whiteLogoUrl: json["white_logo_url"] ?? '',
        faviconImageUrl: json["favicon_image_url"] ?? '',
        loaderImageUrl: json["loader_image_url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_image": logoImage,
        "white_logo": whiteLogo,
        "favicon_image": faviconImage,
        "header_css": headerCss,
        "header_script": headerScript,
        "body_script": bodyScript,
        "free_featured_ad_limit": freeFeaturedAdLimit,
        "regular_ads_homepage": regularAdsHomepage,
        "featured_ads_homepage": featuredAdsHomepage,
        "customer_email_verification": customerEmailVerification,
        "maximum_ad_image_limit": maximumAdImageLimit,
        "subscription_type": subscriptionType,
        "ads_admin_approval": adsAdminApproval,
        "free_ad_limit": freeAdLimit,
        "free_event_limit": freeEventLimit,
        "free_business_directory_limit": freeBusinessDirectoryLimit,
        "sidebar_color": sidebarColor,
        "nav_color": navColor,
        "sidebar_txt_color": sidebarTxtColor,
        "nav_txt_color": navTxtColor,
        "main_color": mainColor,
        "accent_color": accentColor,
        "frontend_primary_color": frontendPrimaryColor,
        "frontend_secondary_color": frontendSecondaryColor,
        "dark_mode": darkMode,
        "facebook_pixel": facebookPixel,
        "google_analytics": googleAnalytics,
        "search_engine_indexing": searchEngineIndexing,
        "default_layout": defaultLayout,
        "website_loader": websiteLoader,
        "loader_image": loaderImage,
        "language_changing": languageChanging,
        "email_verification": emailVerification,
        "watermark_status": watermarkStatus,
        "watermark_type": watermarkType,
        "watermark_text": watermarkText,
        "watermark_image": watermarkImage,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "default_map": defaultMap,
        "google_map_key": googleMapKey,
        "map_box_key": mapBoxKey,
        "default_long": defaultLong,
        "default_lat": defaultLat,
        "push_notification_status": pushNotificationStatus,
        "server_key": serverKey,
        "api_key": apiKey,
        "auth_domain": authDomain,
        "project_id": projectId,
        "storage_bucket": storageBucket,
        "messaging_sender_id": messagingSenderId,
        "app_id": appId,
        "measurement_id": measurementId,
        "facebook": facebook,
        "twitter": twitter,
        "instagram": instagram,
        "youtube": youtube,
        "linkdin": linkdin,
        "whatsapp": whatsapp,
        "fb_app_id": fbAppId,
        "fb_access_token": fbAccessToken,
        "cash_payment": cashPayment,
        "topbar_phone": topbarPhone,
        "currency_name": currencyName,
        "currency_icon": currencyIcon,
        "app_name": appName,
        "app_url": appUrl,
        "google_login": googleLogin,
        "google_client_id": googleClientId,
        "google_client_secret": googleClientSecret,
        "facebook_login": facebookLogin,
        "facebook_client_id": facebookClientId,
        "facebook_client_secret": facebookClientSecret,
        "logo_image_url": logoImageUrl,
        "white_logo_url": whiteLogoUrl,
        "favicon_image_url": faviconImageUrl,
        "loader_image_url": loaderImageUrl,
      };
}
