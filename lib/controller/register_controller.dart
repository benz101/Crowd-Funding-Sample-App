import 'package:crowd_funding_sample_app/helper/box_names.dart';
import 'package:crowd_funding_sample_app/helper/show_snackbar.dart';
import 'package:crowd_funding_sample_app/model/local/user_model.dart';
import 'package:crowd_funding_sample_app/service/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController nameCtrl = TextEditingController(text: '');
  final TextEditingController emailCtrl = TextEditingController(text: '');
  final TextEditingController passwordCtrl = TextEditingController(text: '');
  final TextEditingController passwordConfirmCtrl =
      TextEditingController(text: '');

  bool isShowPassword = false;

  void formValidation() {
    if (emailCtrl.text.isEmpty || passwordCtrl.text.isEmpty) {
      showSnackBar(
        message: 'Text tidak boleh kosong',
      );
      return;
    }

    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailCtrl.text)) {
      showSnackBar(message: 'Format email todak valid');
      return;
    }

    if (passwordCtrl.text.length <= 6) {
      showSnackBar(message: 'Password tidak boleh kurang dari 6 karakter');
      return;
    }

    if (passwordCtrl.text != passwordConfirmCtrl.text) {
      showSnackBar(message: 'Password tidak sama dengan confirm password');
      return;
    }
  }

  Future<void> register() async {
    try {
      await HIVEService<UserModel>(boxName: USER_DATA).addToList(UserModel(
          fullName: nameCtrl.text,
          emailAddress: emailCtrl.text,
          password: passwordCtrl.text,
          alreadyRegistered: true));
      Get.back();
      showSnackBar(message: 'Register is success');
    } catch (e) {
      showSnackBar(message: 'Error because: $e');
    }
  }

  void setShowPassword(bool value) {
    isShowPassword = value;
    update();
  }
}
