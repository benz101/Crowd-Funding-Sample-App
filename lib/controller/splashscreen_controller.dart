import 'package:crowd_funding_sample_app/ui/authentication/login/login_page.dart';
import 'package:crowd_funding_sample_app/ui/main_page/main_page.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  String welcomeText = 'Welcome to The App';

  @override
  void onInit() {
    checkAuthorization();
    super.onInit();
  }

  Future<void> checkAuthorization() async {
    await Future.delayed(const Duration(seconds: 1));
     Get.offNamed(MainPage.routeName);

      // Box<UserSessionModel> userSessionModel =
      //     await HIVEService<UserSessionModel>(boxName: USER_SESSION_DATA)
      //         .getBox();
      // if (userSessionModel.get('user_session_id')?.isLogin ?? false) {
      //   Get.offNamed(AttendancePage.routeName);
      // } else {
      //   Get.offNamed(LoginPage.routeName);
      // }
  }
}