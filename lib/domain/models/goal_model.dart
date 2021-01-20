import 'package:daily_goals/domain/models/db_model.dart';
import 'package:daily_goals/domain/models/goal_form_model.dart';
import 'package:daily_goals/domain/models/task_model.dart';
import 'package:daily_goals/presentation/helpers.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Status { Pending, Done }

class GoalModel extends DBModel {
  GoalModel({
    String id,
    @required this.date,
    @required this.idTask,
    this.time,
    this.task,
    Status status,
    bool useTime,
  })  : this.id = id ?? Uuid().v4(),
        this.status = status ?? Status.Pending,
        this.useTime = useTime ?? false;

  final String id;
  final DateTime date;
  final String idTask;
  final TaskModel task;
  final DateTime time;
  bool useTime;
  Status status;

  factory GoalModel.fromJson(Map<String, dynamic> json) => GoalModel(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        time: DateTime.parse(json["time"]),
        idTask: json["id_task"],
        status: Status.values[json["status"]],
        useTime: json["use_time"] == 1 ? true : false,
        task: TaskModel.fromJson(
          {
            'id': json['id_task'],
            'name': json['name_task'],
            'description': json['description_task'],
            'priority': json['priority_task'],
          },
        ),
      );
  factory GoalModel.fromTask(TaskModel task, DateTime date) => GoalModel(
        date: date,
        idTask: task.id,
      );
  factory GoalModel.fromForm(GoalFormModel form, String idTask) => GoalModel(
        date: form.date,
        idTask: idTask,
        time: form.time,
        useTime: form.useTime,
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": this.id,
        "date": Formatter.db(this.date),
        "time": Formatter.db(this.time, time: true),
        "id_task": this.idTask,
        "status": this.status.index,
        "use_time": this.useTime ? 1 : 0,
      };
}

String statusToString(Status exc) => exc.toString().split('.').last;
