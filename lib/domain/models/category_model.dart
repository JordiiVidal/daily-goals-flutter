import 'package:daily_goals/domain/models/db_model.dart';
import 'package:daily_goals/domain/models/form_category_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CategoryModel extends DBModel {
  CategoryModel({
    String id,
    @required this.name,
    int color,
    @required this.icon,
  })  : this.id = id ?? Uuid().v4(),
        this.color = color ?? 0XFFeb06ff;

  String id;
  String name;
  int color;
  int icon;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        color: int.parse(json["color"]),
        icon: int.parse(json["icon"]),
      );
  factory CategoryModel.fromForm(FormCategoryModel form) => CategoryModel(
        name: form.name,
        color: form.color.value,
        icon: form.icon.codePoint,
      );
      
  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "icon": icon,
      };
}
