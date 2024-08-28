import 'package:crowd_funding_sample_app/controller/splashscreen_controller.dart';
import 'package:get/get.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => SplashScreenController());
  
}