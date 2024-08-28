import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar({required String message}){
   Get.snackbar('Message', message,
          backgroundColor: Colors.black, colorText: Colors.white);
}