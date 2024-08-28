import 'package:crowd_funding_sample_app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchAllController extends GetxController {
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
}