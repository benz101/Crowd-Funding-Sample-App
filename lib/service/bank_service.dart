import 'package:crowd_funding_sample_app/model/response/list_of_banks.dart';
import 'package:flutter/services.dart';

class BankService {
  Future<List<ItemOfBank>?> getListOfBanks() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/banks.json');
      return listOfBanksFromJson(response);
    } catch (e) {
      return null;
    }
  }

}