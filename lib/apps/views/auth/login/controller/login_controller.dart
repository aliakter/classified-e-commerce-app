import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/data/error/failure.dart';
import 'package:classified_apps/apps/routes/routes.dart';
import 'package:classified_apps/apps/views/auth/login/model/setting_model.dart';
import 'package:classified_apps/apps/views/auth/repository/auth_repository.dart';
import 'package:classified_apps/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository;

  LoginController(this.authRepository);

  final formKey = GlobalKey();
  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController passwordCtl = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isSettingLoading = false.obs;
  RxBool obscureText = true.obs;
  Rxn<SettingModel> settingModel = Rxn<SettingModel>();

  ///google auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  ///facebook auth
  final FirebaseAuth _fbAuth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  // UserLoginResponseModel? _user;
  // bool get isLoggedIn => _user != null && _user!.token.isNotEmpty;
  // UserLoginResponseModel? get userInfo => _user;
  // set user(UserLoginResponseModel userData) => _user = userData;
  // void cacheUserData() => authRepository.saveCashedUserInfo(_user!);
  // void cacheUserWithData(UserLoginResponseModel userData) =>
  //     authRepository.saveCashedUserInfo(userData);

  String token = "";
  String userId = "";
  String userFullName = "";
  String username = "";
  String userEmail = "";
  String userPhone = "";
  String userWebsite = "";
  String userImage = "";

  @override
  void onInit() {
    /// set user data if user already login
    // final result = authRepository.getCashedUserInfo();
    // result.fold(
    //   (l) => _user = null,
    //   (r) {
    //     user = r;
    //   },
    // );
    super.onInit();
    getSettingData();
  }

  void getSettingData() async {
    isSettingLoading.value = true;
    final result = await authRepository.getSettingData();
    result.fold((error) {
      isSettingLoading.value = false;
      print(error.message);
    }, (data) async {
      settingModel.value = data;
      isSettingLoading.value = false;
    });
  }

  void toggle() {
    obscureText.toggle();
    update();
  }

  bool isEmailOkay() {
    if (emailCtr.text.isNotEmpty && GetUtils.isEmail(emailCtr.text)) {
      return true;
    }
    return false;
  }

  bool isPasswordOkay() {
    if (passwordCtl.text.isNotEmpty && passwordCtl.text.length > 2) return true;
    return false;
  }

  void login() async {
    if (isEmailOkay() && isPasswordOkay()) {
      final body = <String, String>{};
      body.addAll({"username": emailCtr.text.trim()});
      body.addAll({"password": passwordCtl.text.trim()});

      isLoading.value = true;
      final result = await authRepository.login(body);

      result.fold((error) {
        isLoading.value = false;
        Utils.toastMsg(error.message);
      }, (data) async {
        sharedPreferences.setString("userToken", data.loginToken);
        sharedPreferences.setString("userId", data.user.id.toString() ?? "");
        sharedPreferences.setString(
            "userFullName", data.user.name.toString() ?? "");
        sharedPreferences.setString(
            "username", data.user.username.toString() ?? "");
        sharedPreferences.setString(
            "userEmail", data.user.email.toString() ?? "");
        sharedPreferences.setString("userPhone", data.user.phone ?? "");
        sharedPreferences.setString("userWebsite", data.user.website ?? "");
        sharedPreferences.setString(
            "userImage", data.user.image.toString() ?? "");

        token = sharedPreferences.getString("userToken") ?? "";
        userId = sharedPreferences.getString("userId") ?? "";
        userFullName = sharedPreferences.getString("userFullName") ?? "";
        username = sharedPreferences.getString("username") ?? "";
        userEmail = sharedPreferences.getString("userEmail") ?? "";
        userPhone = sharedPreferences.getString("userPhone") ?? "";
        userWebsite = sharedPreferences.getString("userWebsite") ?? "";
        userImage = sharedPreferences.getString("userImage") ?? "";
        emailCtr.text = "";
        passwordCtl.text = "";
        isLoading.value = false;
        Get.offAllNamed(Routes.main);
      });
    } else if (!isEmailOkay()) {
      Utils.toastMsg("Please enter your email");
    } else if (!isPasswordOkay()) {
      Utils.toastMsg("Please enter your password");
    }
  }

  Future<void> handleGoogleSignIn() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        signInOption: SignInOption.standard,
        scopes: ['email'],
      );

      await googleSignIn.signIn().then((GoogleSignInAccount? acc) async {
        GoogleSignInAuthentication auth = await acc!.authentication;
        if (kDebugMode) {
          print(acc.id);
          print(acc.email);
          print(acc.displayName);
          print(acc.photoUrl);
        }
        if (kReleaseMode) {
          print(acc.id);
          print(acc.email);
          print(acc.displayName);
          print(acc.photoUrl);
        }

        ///
        if (auth.accessToken != null) {
          final body = <String, dynamic>{};
          body.addAll({'id': acc.id});
          body.addAll({'name': acc.displayName});
          body.addAll({'username': acc.displayName});
          body.addAll({'email': acc.email});
          body.addAll({'token': auth.accessToken});
          body.addAll({'provider': 'google'});

          final result = await authRepository.socialLogin(body);
          result.fold(
            (Failure error) {
              print(error.message);
            },
            (data) {
              sharedPreferences.setString("userToken", data.loginToken);
              sharedPreferences.setString(
                  "userId", data.user.id.toString() ?? "");
              sharedPreferences.setString(
                  "userFullName", data.user.name.toString() ?? "");
              sharedPreferences.setString(
                  "username", data.user.username.toString() ?? "");
              sharedPreferences.setString(
                  "userEmail", data.user.email.toString() ?? "");
              sharedPreferences.setString(
                  "userPhone", data.user.phone.toString() ?? "");
              sharedPreferences.setString(
                  "userWebsite", data.user.website.toString() ?? "");
              sharedPreferences.setString(
                  "userImage", data.user.image.toString() ?? "");

              token = sharedPreferences.getString("userToken") ?? "";
              userId = sharedPreferences.getString("userId") ?? "";
              userFullName = sharedPreferences.getString("userFullName") ?? "";
              username = sharedPreferences.getString("username") ?? "";
              userEmail = sharedPreferences.getString("userEmail") ?? "";
              userPhone = sharedPreferences.getString("userPhone") ?? "";
              userWebsite = sharedPreferences.getString("userWebsite") ?? "";
              userImage = sharedPreferences.getString("userImage") ?? "";
              Get.offAndToNamed(Routes.main);
            },
          );
        }
      });
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<UserCredential?> handleFbSignIn() async {
    //   try {
    //     final LoginResult result = await _facebookAuth.login();
    //     final AuthCredential credential =
    //         FacebookAuthProvider.credential(result.accessToken!.token);
    //     return await _fbAuth.signInWithCredential(credential);
    //   } catch (error) {
    //     print(error);
    return null;
    //   }
  }
}
