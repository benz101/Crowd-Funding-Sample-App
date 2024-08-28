import 'package:crowd_funding_sample_app/helper/box_names.dart';
import 'package:crowd_funding_sample_app/model/local/user_model.dart';
import 'package:crowd_funding_sample_app/service/hive_service.dart';
import 'package:crowd_funding_sample_app/ui/authentication/login/login_page.dart';
import 'package:crowd_funding_sample_app/ui/main_page/chart_page.dart';
import 'package:crowd_funding_sample_app/ui/main_page/home_page.dart';
import 'package:crowd_funding_sample_app/ui/main_page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  UserModel? userModel;

  List<BottomNavigationBarItem> listMenu = [
    const BottomNavigationBarItem(
        label: 'Beranda', icon: Icon(Icons.home_outlined)),
    const BottomNavigationBarItem(
        label: 'Cari', icon: Icon(Icons.search_outlined)),
    const BottomNavigationBarItem(
        label: 'Keranjang', icon: Icon(Icons.shopping_basket_outlined))
  ];

  List<Widget> listPages = [
    const HomePage(),
    const SearchPage(),
    const ChartPage()
  ];

  int currentIndex = 0;

  @override
  void onInit() async {
    userModel =
        await HIVEService<UserModel>(boxName: USER_DATA).get('user_data_id');
    super.onInit();
  }

  void setCurrentIndex(v) {
    if (userModel?.alreadyLogin ?? false) {
      currentIndex = v;
      update();
    } else {
      if (v == 2) {
        Get.toNamed(LoginPage.routeName);
      } else {
        currentIndex = v;
        update();
      }
    }
  }
}
