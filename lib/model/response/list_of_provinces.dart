import 'dart:convert';

List<ItemOfProvince> listOfProvincesFromJson(String str) => List<ItemOfProvince>.from(json.decode(str).map((x) => ItemOfProvince.fromJson(x)));

String listOfProvincesToJson(List<ItemOfProvince> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemOfProvince {
    int? id;
    String? name;

    ItemOfProvince({
        this.id,
        this.name,
    });

    factory ItemOfProvince.fromJson(Map<String, dynamic> json) => ItemOfProvince(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}