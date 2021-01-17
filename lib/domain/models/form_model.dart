import 'package:daily_goals/domain/models/task_model.dart';

class FormModel {
  FormModel({
    this.name,
    String idCategory,
    DateTime time,
    DateTime date,
    Exigency exigency,
    bool useTime,
  })  : this.exigency = exigency ?? Exigency.Medium,
        this.date = date ?? DateTime.now(),
        this.time = time ?? DateTime.now(),
        this.useTime = useTime ?? true,
        this.idCategory = idCategory ?? '';

  String name;
  Exigency exigency;
  DateTime date;
  DateTime time;
  String idCategory;
  bool useTime;
}
