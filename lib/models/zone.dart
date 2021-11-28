
import 'dart:convert';


class Zone {
  String httpStatus;
  List<Category> zones;

  Zone(this.httpStatus, this.zones);

  factory Zone.fromJson(Map<String, dynamic> json) {
    var categoriesJson = json["zone"] as List;
    
    List<Category> _categories = categoriesJson.map((item) => Category.fromJson(item)).toList();

    return Zone(json["httpStatus"], _categories);
  }
}

class Category {
  int id;
  String zoneId;
  String nameZh;
  String nameEn;
  String iconZh;
  String iconEn;
  int index;

  Category(
      {
        required this.id,
        required this.zoneId,
        required this.nameZh,
        required this.nameEn,
        required this.iconZh,
        required this.iconEn,
        required this.index
      }
  );

  factory Category.fromJson(dynamic json) {
    return Category(
        id: json['id'],
        zoneId: json['zoneId'] ?? "",
        nameZh: json['nameZh'] ?? "",
        nameEn: json['nameEn'] ?? "",
        iconZh: json['iconZh'] ?? "",
        iconEn: json['iconEn'] ?? "",
        index: json['index'] ?? ""
    );
  }
}