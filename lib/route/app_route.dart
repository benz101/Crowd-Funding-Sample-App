import 'package:crowd_funding_sample_app/binding/authentication_binding.dart';
import 'package:crowd_funding_sample_app/binding/main_binding.dart';
import 'package:crowd_funding_sample_app/binding/personal_info_binding.dart';
import 'package:crowd_funding_sample_app/binding/profile_binding.dart';
import 'package:crowd_funding_sample_app/binding/splashscreen_binding.dart';
import 'package:crowd_funding_sample_app/ui/authentication/login/login_page.dart';
import 'package:crowd_funding_sample_app/ui/authentication/register/register_page.dart';
import 'package:crowd_funding_sample_app/ui/main_page/main_page.dart';
import 'package:crowd_funding_sample_app/ui/profile_pages/personal_info/personal_info_page.dart';
import 'package:crowd_funding_sample_app/ui/profile_pages/profile_page.dart';
import 'package:crowd_funding_sample_app/ui/splashscreen/splash_screen_page.dart';
import 'package:get/get.dart';

class AppRoute {
  List<GetPage<dynamic>>? get getPages {
    return [
       GetPage(
          name: SplashScreenPage.routeName,
          page: () => SplashScreenPage(),
          binding: SplashscreenBinding()),
      GetPage(
          name: LoginPage.routeName,
          page: () => LoginPage(),
          binding: AuthenticationBinding()),
      GetPage(name: RegisterPage.routeName, page: () => RegisterPage()),
      GetPage(
          name: MainPage.routeName,
          page: () => MainPage(),
          binding: MainBinding()),
      GetPage(
          name: ProfilePage.routeName,
          page: () => ProfilePage(),
          binding: ProfileBinding()),
      GetPage(
          name: PersonalInfoPage.routeName,
          page: () => PersonalInfoPage(),
          binding: PersonalInfoBinding())
    ];
  }
}
