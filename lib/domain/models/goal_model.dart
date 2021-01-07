import 'package:daily_goals/domain/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Status { Pending, Suspended, Done }

class GoalModel {
  GoalModel({
    String id,
    @required this.date,
    @required this.idTask,
    TaskModel task,
    Status status,
  })  : this.id = id ?? Uuid().v4(),
        this.task = task,
        this.status = status ?? Status.Pending;

  final String id;
  final String date;
  final String idTask;
  final TaskModel task;
  Status status;

  factory GoalModel.fromJson(Map<String, dynamic> json) => GoalModel(
        id: json["id"],
        date: json["date"],
        idTask: json["id_task"],
        status: Status.values[json["status"]],
        task: TaskModel.fromJson(
          {
            'id': json['id_task'],
            'name': json['name_task'],
            'description': json['description_task'],
            'exigency': json['exigency_task'],
          },
        ),
      );
  factory GoalModel.fromTask(TaskModel task, String date) => GoalModel(
        date: date,
        idTask: task.id,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "id_task": idTask,
        "status": status.index,
      };
}
