// To parse this JSON data, do
//
//     final ItemOfDistrict = ItemOfDistrictFromJson(jsonString);

import 'dart:convert';

List<ItemOfDistrict> listOfDistrictsFromJson(String str) => List<ItemOfDistrict>.from(json.decode(str).map((x) => ItemOfDistrict.fromJson(x)));

String listOfDistrictsToJson(List<ItemOfDistrict> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemOfDistrict {
    int? id;
    int? regencyId;
    String? name;

    ItemOfDistrict({
        this.id,
        this.regencyId,
        this.name,
    });

    factory ItemOfDistrict.fromJson(Map<String, dynamic> json) => ItemOfDistrict(
        id: json["id"],
        regencyId: json["regency_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "regency_id": regencyId,
        "name": name,
    };
}
