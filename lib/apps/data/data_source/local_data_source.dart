import 'dart:convert';
import 'package:classified_apps/apps/core/utils/k_strings.dart';
import 'package:classified_apps/apps/core/utils/my_sharedpreferences.dart';
import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/views/auth/login/model/login_model.dart';
import 'package:classified_apps/apps/views/splash/languages/model/language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../error/exception.dart';

abstract class LocalDataSource {
  UserLoginResponseModel getUserResponseModel();
  Future<bool> cacheUserResponse(UserLoginResponseModel userLoginResponseModel);
  // Future<bool> cacheUserProfile(UserProfileModel userProfileModel);
  Future<bool> clearUserProfile();
  // bool checkOnBoarding();
  // Future<bool> cacheOnBoarding();
  //
  // Future<bool> cacheWebsiteSetting(AppSettingModel result);
  // AppSettingModel getWebsiteSetting();
  // //.......... Social Icons ............
  // List<SocialLinkModel> getSocialLinks();
  // Future<bool> cacheSocialLinks(List<SocialLinkModel> socialLinks);
  // bool checkSocialLink();
  // Future<bool> cacheSocialDate();
  ///
  //.............. language ..............
  Future<bool> cacheLanguages(List<LanguageModel> languages);
  bool checkLanguage();
  Future<bool> cacheLanguage();

  List<LanguageModel> getCachedLanguages();
}

class LocalDataSourceImpl implements LocalDataSource {
  final _className = 'LocalDataSourceImpl';
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  UserLoginResponseModel getUserResponseModel() {
    final jsonString =
        sharedPreferences.getString(MySharedPreference.cachedUserResponseKey);
    if (jsonString != null) {
      return UserLoginResponseModel.fromJson(jsonString);
    } else {
      throw const DatabaseException('Not cached yet');
    }
  }

  ///
  @override
  Future<bool> cacheUserResponse(UserLoginResponseModel userLoginResponseModel) {
    return sharedPreferences.setString(
      MySharedPreference.cachedUserResponseKey,
      userLoginResponseModel.toJson(),
    );
  }

  ///
  // @override
  // Future<bool> cacheUserProfile(UserProfileModel userProfileModel) {
  //   final user = getUserResponseModel();
  //   user.user != userProfileModel;
  //   return cacheUserResponse(user);
  // }

  @override
  Future<bool> clearUserProfile() {
    return sharedPreferences.remove(MySharedPreference.cachedUserResponseKey);
  }
//
// @override
// bool checkOnBoarding() {
//   final jsonString = sharedPreferences.getBool(MySharedPreference.sOnBoarding);
//   if (jsonString != null) {
//     return true;
//   } else {
//     throw const DatabaseException('Not cached yet');
//   }
// }
//
// @override
// Future<bool> cacheOnBoarding() {
//   return sharedPreferences.setBool(MySharedPreference.sOnBoarding, true);
// }
//
// @override
// Future<bool> cacheWebsiteSetting(AppSettingModel settingModel) async {
//   // log(settingModel.toJson(), name: _className);
//   return sharedPreferences.setString(
//       MySharedPreference.cachedWebSettingKey, settingModel.toJson());
// }
//
// @override
// AppSettingModel getWebsiteSetting() {
//   final jsonString =
//   sharedPreferences.getString(MySharedPreference.cachedWebSettingKey);
//   // log(jsonString.toString(), name: _className);
//   if (jsonString != null) {
//     return AppSettingModel.fromJson(jsonString);
//   } else {
//     throw const DatabaseException('Not cached yet');
//   }
// }
//
//
// //.......... Social Icons ............
// @override
// List<SocialLinkModel> getSocialLinks() {
//   final jsonString = sharedPreferences.getString(MySharedPreference.cacheSocialLinksKey);
//   if (jsonString != null) {
//     var mapData = json.decode(jsonString.toString());
//     return List<dynamic>.from(mapData["data"]).map((e) => SocialLinkModel.fromJson(e)).toList();
//   } else {
//     throw const DatabaseException('Not cached yet');
//   }
// }
//
// @override
// Future<bool> cacheSocialLinks(List<SocialLinkModel> socialLinks) {
//   var data = {};
//   data["data"] = socialLinks;
//   return sharedPreferences.setString(MySharedPreference.cacheSocialLinksKey, json.encode(data));
// }
//
// @override
// bool checkSocialLink() {
//   final jsonString = sharedPreferences.getString(MySharedPreference.isCachedSocialLinks);
//   if (jsonString != null) {
//     int days = Utils.calculateMaxDays(jsonString, DateTime.now().toString());
//     print("........ Days $days .............");
//     return days > 3 ? false : true;
//   } else {
//     throw const DatabaseException('Not cached yet');
//   }
// }
//
// @override
// Future<bool> cacheSocialDate() {
//   return sharedPreferences.setString(MySharedPreference.isCachedSocialLinks, DateTime.now().toString());
// }

//................ Language ................

  @override
  bool checkLanguage() {
    final jsonString = sharedPreferences.getString(KStrings.isCachedAllLanguage);
    if (jsonString != null) {
      int days = Utils.calculateMaxDays(jsonString, DateTime.now().toString());
      print("........dddddddddddddddddddddddd  Days $days ddddddddddddddddddddddddddddd.............");
      return days > 0 ? false : true;
    } else {
      throw const DatabaseException('Not cached yet');
    }
  }

  @override
  Future<bool> cacheLanguage() {
    return sharedPreferences.setString(KStrings.isCachedAllLanguage, DateTime.now().toString());
  }

  @override
  Future<bool> cacheLanguages(List<LanguageModel> languages) async {
    var data = {};
    data["data"] = languages;
    sharedPreferences.setString(KStrings.cachedAllLanguage, json.encode(data));
    for(LanguageModel language in languages){
      sharedPreferences.setString(language.code, json.encode(language.jsonData));
    }
    return true;
  }

  @override
  List<LanguageModel> getCachedLanguages() {
    final jsonString =
    sharedPreferences.getString(KStrings.cachedAllLanguage);
    // log(jsonString.toString(), name: _className);
    if (jsonString != null) {
      var mapData = json.decode(jsonString.toString());
      // print('zzzzzzzzzzzzzzzzzzzzzzzzzzzz $mapData zzzzzzzzzzzzzzzzzzzzzzzz');
      return List<dynamic>.from(mapData["data"]).map((e) => LanguageModel.fromJson(e)).toList();
    } else {
      throw const DatabaseException('Not cached yet');
    }
  }

}
