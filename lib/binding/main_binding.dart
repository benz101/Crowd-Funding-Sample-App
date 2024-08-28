import 'package:crowd_funding_sample_app/controller/chart_controller.dart';
import 'package:crowd_funding_sample_app/controller/home_controller.dart';
import 'package:crowd_funding_sample_app/controller/main_controller.dart';
import 'package:crowd_funding_sample_app/controller/search_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.put(HomeController());
    Get.put(SearchAllController());
    Get.put(ChartController());
  }
}
