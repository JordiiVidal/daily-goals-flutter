import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CategoryModel {
  CategoryModel({
    String id,
    @required this.name,
    int color,
    @required this.icon,
    List<int> last7,
  })  : this.id = id ?? Uuid().v4(),
        this.last7 = last7 ?? [],
        this.color = color ?? 0XFFeb06ff;

  String id;
  String name;
  int color;
  int icon;
  List<dynamic> last7;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        color: int.parse(json["color"]),
        icon: int.parse(json["icon"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "icon": icon,
      };
}
