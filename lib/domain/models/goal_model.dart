import 'package:uuid/uuid.dart';

final uuid = Uuid();

enum Status { Pending, Suspended, Done }

class GoalModel {
  GoalModel({
    this.id,
    this.date,
    this.idTask,
    this.status,
  });

  String id;
  String date;
  int idTask;
  Status status;

  factory GoalModel.fromJson(Map<String, dynamic> json) => GoalModel(
        id: json["id"],
        date: json["date"],
        idTask: json["id_task"],
        status: Status.values[int.parse(json["status"])],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "id_task": idTask,
        "status": status.index,
      };
}
