import 'package:classified_apps/apps/views/ad_details/ad_details_screen.dart';
import 'package:classified_apps/apps/views/ad_details/binding/ad_details_binding.dart';
import 'package:classified_apps/apps/views/ad_post/ad_post_screen.dart';
import 'package:classified_apps/apps/views/ad_post/binding/ad_post_binding.dart';
import 'package:classified_apps/apps/views/ads/ads_screen.dart';
import 'package:classified_apps/apps/views/ads/binding/ads_binding.dart';
import 'package:classified_apps/apps/views/ads_edit/ads_edit_screen.dart';
import 'package:classified_apps/apps/views/ads_edit/binding/ad_edit_binding.dart';
import 'package:classified_apps/apps/views/auth/forgot_password/binding/forgot_password_binding.dart';
import 'package:classified_apps/apps/views/auth/forgot_password/forgot_password_screen.dart';
import 'package:classified_apps/apps/views/auth/login/binding/login_binding.dart';
import 'package:classified_apps/apps/views/auth/login/login_screen.dart';
import 'package:classified_apps/apps/views/auth/registration/binding/signup_binding.dart';
import 'package:classified_apps/apps/views/auth/registration/signup_screen.dart';
import 'package:classified_apps/apps/views/chat/binding/chat_binding.dart';
import 'package:classified_apps/apps/views/chat/chat_screen.dart';
import 'package:classified_apps/apps/views/chat_details/binding/chat_details_binding.dart';
import 'package:classified_apps/apps/views/chat_details/screens/chat_details_screen.dart';
import 'package:classified_apps/apps/views/compare/binding/compare_binding.dart';
import 'package:classified_apps/apps/views/dashboard/binding/dashboard_binding.dart';
import 'package:classified_apps/apps/views/dashboard/dashboard_screen.dart';
import 'package:classified_apps/apps/views/main/binding/main_screen_binding.dart';
import 'package:classified_apps/apps/views/main/views/main_screen.dart';
import 'package:classified_apps/apps/views/my_ads/binding/my_ads_binding.dart';
import 'package:classified_apps/apps/views/my_ads/my_ads_screen.dart';
import 'package:classified_apps/apps/views/price_planing/binding/price_planing_binding.dart';
import 'package:classified_apps/apps/views/price_planing/views/price_planing_screen.dart';
import 'package:classified_apps/apps/views/profile/component/compare_page.dart';
import 'package:classified_apps/apps/views/profile_update/binding/profile_update_binding.dart';
import 'package:classified_apps/apps/views/profile_update/view/profile_update_screen.dart';
import 'package:classified_apps/apps/views/public_profile/binding/public_profile_binding.dart';
import 'package:classified_apps/apps/views/public_profile/public_profile_screen.dart';
import 'package:classified_apps/apps/views/setting/setting_screen.dart';
import 'package:classified_apps/apps/views/splash/binding/splash_binding.dart';
import 'package:classified_apps/apps/views/splash/screens/splash_screen.dart';
import 'package:classified_apps/apps/views/transection/binding/transection_binding.dart';
import 'package:classified_apps/apps/views/transection/transection_screen.dart';
import 'package:classified_apps/apps/views/user_plan/binding/user_plan_binding.dart';
import 'package:classified_apps/apps/views/wishlist/binding/wishlist_binding.dart';
import 'package:classified_apps/apps/views/wishlist/wishlist_screen.dart';
import 'package:get/get.dart';
import '../views/user_plan/views/user_plan_screen.dart';
import 'routes.dart';

class Pages {
  static const initial = SplashScreen();

  static final pages = [
    GetPage(
        name: Routes.initial,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.main,
        page: () => MainScreen(),
        binding: MainScreenBinding()),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignUpScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.forgotPass,
      page: () => const ForgotScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.dashBoard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.publicProfile,
      page: () => const PublicProfileScreen(),
      binding: PublicProfileBinding(),
    ),
    GetPage(
      name: Routes.customerAds,
      page: () => const MyAdsScreen(),
      binding: MyAdsBinding(),
    ),
    GetPage(
      name: Routes.compareAds,
      page: () => const ComparePage(),
      binding: CompareBinding(),
    ),
    GetPage(
      name: Routes.favoriteAds,
      page: () => const FavouriteListScreen(),
      binding: FavouritelistBinding(),
    ),
    GetPage(
      name: Routes.transaction,
      page: () => const TransactionScreen(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: Routes.setting,
      page: () => const SettingScreen(),
      // binding: MainScreenBinding(),
    ),
    GetPage(
      name: Routes.chat,
      page: () => const ChatScreen(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: Routes.chatDetails,
      page: () => const ChatDetailsScreen(),
      binding: ChatDetailsBinding(),
    ),
    GetPage(
      name: Routes.adDetailsScreen,
      page: () => const AdDetailsScreen(),
      binding: AdDetailsBinding(),
    ),
    GetPage(
      name: Routes.adsScreen,
      page: () => const AdsScreen(),
      binding: AdsBinding(),
    ),
    GetPage(
      name: Routes.adPostScreen,
      page: () => const AdPostScreen(),
      binding: AdPostBinding(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => const ProfileUpdateScreen(),
      binding: ProfileUpdateBinding(),
    ),
    GetPage(
      name: Routes.adsEdit,
      page: () => const AdsEditScreen(),
      binding: AdEditBinding(),
    ),
    GetPage(
      name: Routes.userPlan,
      page: () => const UserPlanScreen(),
      binding: UserPlanBinding(),
    ),
    GetPage(
      name: Routes.pricePlaning,
      page: () => const PricePlaningScreen(),
      binding: PricePlaningBinding(),
    ),
  ];
}
