import 'package:daily_goals/domain/models/task_model.dart';

class GoalFormModel {
  GoalFormModel({
    this.name,
    String idCategory,
    DateTime time,
    DateTime date,
    Priority priority,
    bool useTime,
  })  : this.priority = priority ?? Priority.Medium,
        this.date = date ?? DateTime.now(),
        this.time = time ?? DateTime.now(),
        this.useTime = useTime ?? true,
        this.idCategory = idCategory ?? '';

  String name;
  Priority priority;
  DateTime date;
  DateTime time;
  String idCategory;
  bool useTime;
}
