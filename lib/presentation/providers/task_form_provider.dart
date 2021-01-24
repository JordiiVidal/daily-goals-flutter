import 'package:daily_goals/data/datasources/db_local_storage.dart';
import 'package:daily_goals/domain/models/goal_form_model.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/models/task_model.dart';

class GoalFormProvider extends ChangeNotifier {
  final GoalFormModel _formState = GoalFormModel();
  final List<Priority> _chipsItems = [
    Priority.Low,
    Priority.Medium,
    Priority.High,
  ];
  String _errorName = '';

  String get errorName => _errorName;
  GoalFormModel get formState => _formState;
  List<Priority> get chipsItems => _chipsItems;
  int get priorityState => _formState.priority.index;
  DateTime get timeForm => _formState.time;
  DateTime get dateForm => _formState.date;
  bool get useTime => _formState.useTime;

  void setPriority(int index) {
    _formState.priority = _chipsItems[index];
    notifyListeners();
  }


  void setTime(DateTime dateTime, {bool useTime = true}) {
    _formState.time = dateTime;
    _formState.useTime = useTime;
    notifyListeners();
  }

  void setDate(DateTime dateTime) {
    _formState.date = dateTime;
    notifyListeners();
  }

  void setName(String name) async {
    _formState.name = name;
    if (name == null || name == "" || name.length < 3) {
      _errorName = 'Minimum 3 characters';
    } else {
      final exist =
          await DBLocalStorage.db.existByWhere('Task', 'name = ?', [name]);
      _errorName = exist ? 'Existed Task' : null;
    }
    notifyListeners();
  }
}
