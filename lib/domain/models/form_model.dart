import 'package:daily_goals/domain/models/task_model.dart';

class FormModel {
  FormModel({
    this.name,
    this.category,
    this.date,
    this.time,
    Exigency exigency,
  }) : this.exigency = exigency ?? Exigency.Medium;

  String name;
  Exigency exigency;
  String date;
  String time;
  String category;
}
