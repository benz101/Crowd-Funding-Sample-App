import 'dart:convert';

import 'package:crowd_funding_sample_app/helper/box_names.dart';
import 'package:crowd_funding_sample_app/model/local/user_model.dart';
import 'package:crowd_funding_sample_app/service/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  UserModel? userModel; 

  List<FinancialProduct> listOfFinancialProducts = [
    FinancialProduct(
        icon: Icon(Icons.people, color: Colors.amber[400]), name: 'Urun Dana'),
    FinancialProduct(
        icon: Icon(Icons.attach_money, color: Colors.green[400]),
        name: 'Pembiayaan Haji'),
    FinancialProduct(
        icon: Icon(
          Icons.newspaper,
          color: Colors.blue[400],
        ),
        name: 'Financial Check Up'),
    FinancialProduct(
        icon: Icon(
          Icons.car_rental,
          color: Colors.cyan[400],
        ),
        name: 'Asuransi Mobil'),
    FinancialProduct(
      icon: Icon(Icons.house, color: Colors.red[400]),
      name: 'Asuransi Properti',
    )
  ];
  List<OptionCategory> listOfOptionCategory = [
    OptionCategory(
        icon: Icon(Icons.book, color: Colors.red[400]), name: 'Merchandise'),
    OptionCategory(
        icon: Icon(Icons.health_and_safety, color: Colors.blue[400]),
        name: 'Gaya Hidup Sehat'),
    OptionCategory(
        icon: Icon(Icons.add_reaction_rounded, color: Colors.green[400]),
        name: 'Konseling & Rohani'),
    OptionCategory(
        icon: Icon(
          Icons.self_improvement,
          color: Colors.amber[400],
        ),
        name: 'Self Development'),
    OptionCategory(
        icon: Icon(
          Icons.money_rounded,
          color: Colors.lime[400],
        ),
        name: 'Perencanaan Keuangan'),
    OptionCategory(
        icon: Icon(Icons.medical_information, color: Colors.purple[400]),
        name: 'Konsultasi Medis'),
    OptionCategory(
        icon: Icon(Icons.view_comfy_alt_rounded, color: Colors.yellow[400]),
        name: 'Lihat Semua')
  ];
  List<Wellness> listOfWellness = [
    Wellness(
        icon: Image.asset('assets/images/img_grab.png'),
        name: 'Voucher Transport Grab',
        price: 20000),
    Wellness(
        icon: Image.asset('assets/images/img_gojek.png'),
        name: 'Voucher Transport Gojek',
        price: 20000),
    Wellness(
        icon: Image.asset('assets/images/img_alfamart.png'),
        name: 'Voucher Belanja Alfamart',
        price: 50000),
    Wellness(
        icon: Image.asset('assets/images/img_indomaret.png'),
        name: 'Voucher Belanja Indomaret',
        price: 50000),
    Wellness(
        icon: Image.asset('assets/images/img_indosat.png'),
        name: 'Voucher Kuota Indosat',
        price: 15000),
    Wellness(
        icon: Image.asset('assets/images/img_pln.png'),
        name: 'Voucher Token PLN',
        price: 25000),
  ];

  @override
  void onInit() async{
    userModel = await HIVEService<UserModel>(boxName: USER_DATA).get('user_data_id');
    debugPrint(jsonEncode(userModel?.toJson()));
    update();
    super.onInit();
  }
}

class FinancialProduct {
  Widget icon;
  String name;
  FinancialProduct({required this.icon, required this.name});
}

class OptionCategory {
  Widget icon;
  String name;

  OptionCategory({required this.icon, required this.name});
}

class Wellness {
  Widget icon;
  String name;
  double price;

  Wellness({required this.icon, required this.name, required this.price});
}
