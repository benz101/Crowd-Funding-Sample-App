import 'package:crowd_funding_sample_app/helper/box_names.dart';
import 'package:crowd_funding_sample_app/model/local/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HIVEOpenBoxes {
  Future<void> open() async {
    debugPrint('open box initalization');
    await Hive.openBox<UserModel>(USER_DATA);
  }
}