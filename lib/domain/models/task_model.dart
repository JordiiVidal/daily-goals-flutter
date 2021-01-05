import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Exigency { Low, Medium, High }

class TaskModel {
  TaskModel({
    String id,
    @required this.name,
    this.description,
    Exigency exigency,
  })  : this.id = id ?? Uuid().v4(),
        this.exigency = exigency ?? Exigency.Medium;

  final String id;
  String name;
  String description;
  Exigency exigency;

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json["id"],
      name: json["name"],
      exigency: Exigency.values[json["exigency"]],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "exigency": exigency.index,
      };
}

String exigencyToString(Exigency exc) => exc.toString().split('.').last;
