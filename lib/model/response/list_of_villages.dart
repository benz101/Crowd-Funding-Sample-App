// To parse this JSON data, do
//
//     final listOfVillages = listOfVillagesFromJson(jsonString);

import 'dart:convert';

List<ItemOfVillage> listOfVillagesFromJson(String str) => List<ItemOfVillage>.from(json.decode(str).map((x) => ItemOfVillage.fromJson(x)));

String listOfVillagesToJson(List<ItemOfVillage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemOfVillage {
    int? id;
    int? districtId;
    String? name;

    ItemOfVillage({
        this.id,
        this.districtId,
        this.name,
    });

    factory ItemOfVillage.fromJson(Map<String, dynamic> json) => ItemOfVillage(
        id: json["id"],
        districtId: json["district_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "district_id": districtId,
        "name": name,
    };
}
