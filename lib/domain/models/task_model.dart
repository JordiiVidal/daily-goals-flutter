import 'package:daily_goals/domain/models/db_model.dart';
import 'package:daily_goals/domain/models/form_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Exigency { Low, Medium, High }

class TaskModel extends DBModel {
  TaskModel({
    String id,
    @required this.name,
    this.description,
    Exigency exigency,
    String idCategory,
  })  : this.id = id ?? Uuid().v4(),
        this.exigency = exigency ?? Exigency.Medium,
        this.idCategory = idCategory ?? '';

  final String id;
  String name;
  String description;
  Exigency exigency;
  String idCategory;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        name: json["name"],
        exigency: Exigency.values[json["exigency"]],
        idCategory: json["id_category"],
      );

  factory TaskModel.fromForm(FormModel form) => TaskModel(
      name: form.name, exigency: form.exigency, idCategory: form.idCategory);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "exigency": exigency.index,
        "id_category": idCategory,
      };
}

String exigencyToString(Exigency exc) => exc.toString().split('.').last;
