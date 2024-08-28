import 'package:crowd_funding_sample_app/controller/login_controller.dart';
import 'package:get/get.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => LoginController());
}