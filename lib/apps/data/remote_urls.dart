class RemoteUrls {
  static const String rootUrl = 'https://stagging.dhakasoftwares.com/';
  static const String baseUrl = '${rootUrl}api/';

  static const String userLogin = '${baseUrl}auth/login';
  static const String socialLogin = '${baseUrl}auth/social-login';
  static const String userRegistration = '${baseUrl}auth/register';
  static const String home = '${baseUrl}home';

  static const String userProfile = '${baseUrl}auth/me';

  static String adsList(
          String searchText,
          String selectedCity,
          String minPrice,
          String maxPrice,
          String sortingValue,
          String categoryValue,
          String page) =>
      '${baseUrl}ads?paginate=10&page=$page&keyword=$searchText&sort_by=$sortingValue&category=$categoryValue&subcategory=&price_max=$maxPrice&price_min=$minPrice';

  static String adDetails(String slug) => '${baseUrl}ads/$slug';

  static String adEdit(String id) => '${baseUrl}ads/edit/$id';

  static String editProfile = "${baseUrl}auth/profile";
  static String forgotPassWord = "${baseUrl}send-forget-password";

  static String publicProfile(String userName, String page) =>
      "${baseUrl}seller/$userName?page=$page&paginate=10";

  static String userTransaction = "${baseUrl}customer/transactions";
  static String changePassword = "${baseUrl}auth/password";
  static String deleteAccount = "${baseUrl}customer/account-delete";
  static String wishlist = "${baseUrl}customer/favourite-list";
  static String userAdsList = "${baseUrl}customer/ads?paginate=10";

  static String setUnSetWishlist(String id) => "${baseUrl}ads/favourite/$id";
  static String postAds = "${baseUrl}ads/create";
  static String postReport = "${baseUrl}report-ads";

  static String updateAds(String id) => "${baseUrl}ads/update/$id";

  static String editAds(String id) => "${baseUrl}ads/edit/$id";

  static String adDelete(String id) => "${baseUrl}customer/ads/$id/delete";
  static String dashboard = "${baseUrl}customer/dashboard-overview";
  static String settingApi = "${baseUrl}settings";
  static String compare = "${baseUrl}compare";
  static String chatList = "${baseUrl}chats/user-list";

  static String chatDetails(String user) => "${baseUrl}chats/$user";

  static String getLanguages = '${baseUrl}language/sync';

  static String getSingleLanguage(String code) => '${baseUrl}language/$code';

  static String setRating(String userName) =>
      '${baseUrl}seller/review/$userName';

  static String registerWithToken(String token, {String? userId}) =>
      "${baseUrl}storeToken?token=$token&user_id=$userId";

  static String userPlan = "${baseUrl}customer/plan";
  static String pricePlaning = "${baseUrl}pricing-plans";
}
