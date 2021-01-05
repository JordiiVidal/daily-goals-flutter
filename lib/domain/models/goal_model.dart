import 'package:daily_goals/domain/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

enum Status { Pending, Suspended, Done }

class GoalModel {
  GoalModel({
    String id,
    @required this.date,
    @required this.idTask,
    TaskModel taskModel,
    Status status,
  })  : this.id = id ?? uuid.v4(),
        this.task = taskModel,
        this.status = status ?? Status.Pending;

  final String id;
  final String date;
  final String idTask;
  final TaskModel task;
  Status status;

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    final taskJson = {
      'id': json['id_task'],
      'name': json['name'],
      'description': json['description'],
      'exigency': json['exigency'],
    };
    return GoalModel(
        id: json["id"],
        date: json["date"],
        idTask: json["id_task"],
        status: Status.values[json["status"]],
        taskModel: TaskModel.fromJson(taskJson));
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "id_task": idTask,
        "status": status.index,
      };
}
