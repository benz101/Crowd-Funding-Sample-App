// To parse this JSON data, do
//
//     final listOfRegencies = listOfRegenciesFromJson(jsonString);

import 'dart:convert';

List<ItemOfRegency> listOfRegenciesFromJson(String str) => List<ItemOfRegency>.from(json.decode(str).map((x) => ItemOfRegency.fromJson(x)));

String listOfRegenciesToJson(List<ItemOfRegency> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemOfRegency {
    int? id;
    int? provinceId;
    String? name;

    ItemOfRegency({
        this.id,
        this.provinceId,
        this.name,
    });

    factory ItemOfRegency.fromJson(Map<String, dynamic> json) => ItemOfRegency(
        id: json["id"],
        provinceId: json["province_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "province_id": provinceId,
        "name": name,
    };
}
