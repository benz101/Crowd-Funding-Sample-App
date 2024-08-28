import 'package:crowd_funding_sample_app/model/local/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HIVEAdapters {
  Future<void> register() async {
    debugPrint('register adapter initialization');
    Hive.registerAdapter(UserModelAdapter());
    // Hive.registerAdapter(AttendanceModelAdapter());
    // Hive.registerAdapter(LocationModelAdapter());
    // Hive.registerAdapter(UserSessionModelAdapter());
  }
}