// To parse this JSON data, do
//
//     final listOfBanks = listOfBanksFromJson(jsonString);

import 'dart:convert';

List<ItemOfBank> listOfBanksFromJson(String str) => List<ItemOfBank>.from(json.decode(str).map((x) => ItemOfBank.fromJson(x)));

String listOfBanksToJson(List<ItemOfBank> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemOfBank {
    String? name;
    String? code;

    ItemOfBank({
        this.name,
        this.code,
    });

    factory ItemOfBank.fromJson(Map<String, dynamic> json) => ItemOfBank(
        name: json["name"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
    };
}
