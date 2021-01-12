import 'package:daily_goals/domain/models/task_model.dart';

class FormModel {
  FormModel({
    this.name,
    this.category,
    DateTime time,
    DateTime date,
    Exigency exigency,
    bool useTime,
  })  : this.exigency = exigency ?? Exigency.Medium,
        this.date = date ?? DateTime.now(),
        this.time = time ?? DateTime.now(),
        this.useTime = useTime ?? true;

  String name;
  Exigency exigency;
  DateTime date;
  DateTime time;
  String category;
  bool useTime;
}
