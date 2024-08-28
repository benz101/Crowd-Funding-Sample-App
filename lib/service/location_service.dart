import 'dart:convert';

import 'package:crowd_funding_sample_app/model/response/list_of_districts.dart';
import 'package:crowd_funding_sample_app/model/response/list_of_provinces.dart';
import 'package:crowd_funding_sample_app/model/response/list_of_regencies.dart';
import 'package:crowd_funding_sample_app/model/response/list_of_villages.dart';
import 'package:flutter/services.dart';

class LocationService {
  Future<List<ItemOfProvince>?> getListOfProvinces() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/provinces.json');
      return listOfProvincesFromJson(response);
    } catch (e) {
      return null;
    }
  }

  Future<List<ItemOfRegency>?> getListOfRegencies(int provinceId) async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/regencies.json');
      final regencies = listOfRegenciesFromJson(response);
      return regencies.where((e) => e.provinceId == provinceId).toList();
    } catch (e) {
      return null;
    }
  }

  Future<List<ItemOfDistrict>?> getListOfDistricts(int regencyId) async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/districts.json');
      final districts = listOfDistrictsFromJson(response);
      return districts.where((e) => e.regencyId == regencyId).toList();
    } catch (e) {
      return null;
    }
  }

  Future<List<ItemOfVillage>?> getListOfVillages(int districtId) async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/villages.json');
      final villages = listOfVillagesFromJson(response);
      return villages.where((e) => e.districtId == districtId).toList();
    } catch (e) {
      return null;
    }
  }
}
