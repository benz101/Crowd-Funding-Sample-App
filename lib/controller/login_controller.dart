import 'package:crowd_funding_sample_app/helper/box_names.dart';
import 'package:crowd_funding_sample_app/helper/show_snackbar.dart';
import 'package:crowd_funding_sample_app/model/local/user_model.dart';
import 'package:crowd_funding_sample_app/service/hive_service.dart';
import 'package:crowd_funding_sample_app/ui/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailCtrl = TextEditingController(text: '');
  final TextEditingController passwordCtrl = TextEditingController(text: '');
  bool isShowPassword = false;


  void loginProcess() async {
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
    try {
      final users = await HIVEService<UserModel>(boxName: USER_DATA).getList();
      final result = users.firstWhereOrNull((e) =>
          e.emailAddress == emailCtrl.text && e.password == passwordCtrl.text);
      if (result != null) {
        await HIVEService<UserModel>(boxName: USER_DATA).saveToObjectById(
            'user_data_id',
            UserModel(
                fullName: result.fullName,
                emailAddress: emailCtrl.text,
                password: passwordCtrl.text,
                alreadyRegistered: true,
                alreadyLogin: true,
                loginDateTime: DateTime.now()));
        Get.offAllNamed(MainPage.routeName);
      } else {
        showSnackBar(message: 'Login failed because user is not found');
      }
    } catch (e) {
      showSnackBar(message: 'Error because: $e');
    }
  }

  void setShowPassword(bool value) {
    isShowPassword = value;
    update();
  }
}
