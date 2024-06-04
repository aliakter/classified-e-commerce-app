import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference {
  static const String sUserId = "userIdBF";
  static const String sEmail = "userEmailBF";
  static const String sName = "userNameBF";
  static const String sMobile = "userMobileBF";
  static const String sProfilePic = "userProfileBF";
  static const String sToken = "tokenBF";
  static const String sSESSION = "sessionBF";
  static const String sTokenExpireDate = "tokenExpireDateBF";

  static const String sOnBoarding = "onBoardingBF";
  static const String sIsCard = "tokenExpireDateBF";
  static const String sIsLoggedIn = "isLoggedIn";

  static int userId = 0;
  static String token = "";
  static String session = "";
  static String email = "";
  static String name = "";
  static String mobile = "";
  static String profilePic = "";
  static String dob = "";
  static int gender = 0;
  static int shopNo = 0;

  // ................ Application Data key Name .................
  static const String cachedUserResponseKey = "cacheUserResponseClassified";

  static const String cacheSocialLinksKey = 'cacheSocialLinksKey';
  static const String isCachedSocialLinks = 'isCachedSocialLinks';

  static void saveData(String key,String value) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString(key, value);
  }

  static Future<String?> getData(String key,String value) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    return localStorage.getString(key);
  }

  static Future<bool> isOnBoardingShown() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final jsonString = localStorage.getBool(sOnBoarding);
    if (jsonString != null) {
      return true;
    }
    return false;
  }

  static Future<bool> cacheOnBoarding() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    return localStorage.setBool(sOnBoarding, true);
  }


  static Future<bool> isCard() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final jsonString = localStorage.getBool(sIsCard);
    if (jsonString != null) {
      return true;
    }
    return false;
  }

  static Future<bool> cacheIsCard() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    return localStorage.setBool(sIsCard, true);
  }


  static Future<bool> isLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final jsonString = localStorage.getBool(sIsLoggedIn);
    if (jsonString != null) {
      return true;
    }
    return false;
  }
  static Future<bool> cacheIsLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    return localStorage.setBool(sIsLoggedIn, true);
  }
  static Future<bool> clearAll() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    return localStorage.clear();
  }

}