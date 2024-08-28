

import 'package:crowd_funding_sample_app/controller/personal_info_controller.dart';
import 'package:get/get.dart';

class PersonalInfoBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => PersonalInfoController());
}