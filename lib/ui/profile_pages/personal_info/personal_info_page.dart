import 'package:crowd_funding_sample_app/controller/personal_info_controller.dart';
import 'package:crowd_funding_sample_app/ui/profile_pages/personal_info/address_info_page.dart';
import 'package:crowd_funding_sample_app/ui/profile_pages/personal_info/biodata_info_page.dart';
import 'package:crowd_funding_sample_app/ui/profile_pages/personal_info/company_info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PersonalInfoPage extends StatelessWidget {
  static const routeName = '/personal-info-page';

  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PersonalInfoController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text('Informasi Pribadi')),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              child: Column(children: [
                StepProgressBuilder(controller: controller),
                ContentBuilder(controller: controller)
              ]),
            ),
          );
        });
  }
}

class StepProgressBuilder extends StatelessWidget {
  final PersonalInfoController controller;
  const StepProgressBuilder({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.orange[300], shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Text('1', style: TextStyle(color: Colors.white)),
              ),
              Expanded(
                  child: Container(
                      height: 2, color: controller.currentStep >= 0?Colors.orange[300]: Colors.orange[300]!.withOpacity(0.3))),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: controller.currentStep >= 1?Colors.orange[300]: Colors.orange[300]!.withOpacity(0.3), shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Text('2', style: TextStyle(color: Colors.white)),
              ),
              Expanded(
                  child: Container(
                      height: 2, color: controller.currentStep >= 1?Colors.orange[300]: Colors.orange[300]!.withOpacity(0.3))),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: controller.currentStep >= 2?Colors.orange[300]: Colors.orange[300]!.withOpacity(0.3), shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Text('3', style: TextStyle(color: Colors.white)),
              )
            ]),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    'Biodata Diri',
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.orange[300]),
                  ),
                ),
                Expanded(child: SizedBox()),
                Container(
                    width: 80,
                    child: Text('Alamat Pribadi',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.orange[300]))),
                Expanded(child: SizedBox()),
                SizedBox(
                    width: 80,
                    child: Text('Informasi Perusahaan',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.orange[300])))
              ])
        ],
      ),
    );
  }
}

class ContentBuilder extends StatelessWidget {
  final PersonalInfoController controller;
  const ContentBuilder({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: double.infinity,
      color: Colors.white,
      child: PageView(
        controller: controller.pageViewcontroller,
        onPageChanged: (v) {
          debugPrint('current page view: $v');
        },
        children: [
          BiodataInfoPage(controller: controller),
          AddressInfoPage(controller: controller),
          CompanyInfoPage(controller: controller)
        ],
      ),
    ));
  }
}
