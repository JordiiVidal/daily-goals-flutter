import 'package:daily_goals/domain/models/db_model.dart';
import 'package:daily_goals/domain/models/goal_form_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Priority { Low, Medium, High }

class TaskModel extends DBModel {
  TaskModel({
    String id,
    @required this.name,
    this.description,
    Priority priority,
    String idCategory,
  })  : this.id = id ?? Uuid().v4(),
        this.priority = priority ?? Priority.Medium,
        this.idCategory = idCategory ?? '';

  final String id;
  String name;
  String description;
  Priority priority;
  String idCategory;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        name: json["name"],
        priority: Priority.values[json["priority"]],
        idCategory: json["id_category"],
      );

  factory TaskModel.fromForm(GoalFormModel form) => TaskModel(
      name: form.name, priority: form.priority, idCategory: form.idCategory);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "priority": priority.index,
        "id_category": idCategory,
      };
}

String priorityToString(Priority exc) => exc.toString().split('.').last;
