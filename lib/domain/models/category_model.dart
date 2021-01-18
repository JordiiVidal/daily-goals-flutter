import 'package:daily_goals/domain/models/db_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'category_form_model.dart';

class CategoryModel extends DBModel {
  CategoryModel({
    String id,
    @required this.name,
    @required this.icon,
    int color,
    int total,
  })  : this.id = id ?? Uuid().v4(),
        this.color = color ?? 0XFFeb06ff,
        this.total = total ?? 0;

  String id;
  String name;
  int color;
  int icon;
  int total;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        color: int.parse(json["color"]),
        icon: int.parse(json["icon"]),
        total: json['total'],
      );
  factory CategoryModel.fromForm(CategoryFormModel form) => CategoryModel(
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
