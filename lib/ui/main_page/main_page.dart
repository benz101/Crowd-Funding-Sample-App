import 'package:crowd_funding_sample_app/controller/main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/main-page';
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MainController(),
        builder: (controller) {
          return Scaffold(
            body: controller.listPages[controller.currentIndex],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.orange[300]),
              child: BottomNavigationBar(
                backgroundColor: Colors.orange[300],
                items: controller.listMenu,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedItemColor: Colors.white,
                onTap: controller.setCurrentIndex,
                currentIndex: controller.currentIndex,
              ),
            ),
          );
        });
  }
}
