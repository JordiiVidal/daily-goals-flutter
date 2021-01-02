import 'package:intl/intl.dart';

import 'package:daily_goals/models/activity.dart';
import 'package:flutter/cupertino.dart';

class GoalsProvider extends ChangeNotifier {
  static const formatDate = "yyyy-MM-dd";
  String _selectedDate = DateFormat(formatDate).format(DateTime.now());
  final Map<String, List<Activity>> _listGoals = {};
  final Map<String, List<String>> _checkedIdActivities = {};

  String get selectedDate => _selectedDate;
  DateTime get selectDateTime => DateTime.parse(_selectedDate);
  Map<String, List<Activity>> get listGoals => _listGoals;
  Map<String, List<String>> get checkedIdActivities => _checkedIdActivities;
  List<String> get checkedSelectedIdActivities =>
      _checkedIdActivities[_selectedDate] ?? [];

  bool isCheckedActivity(String idActivity) {
    return (_checkedIdActivities.containsKey(_selectedDate) &&
            _checkedIdActivities[_selectedDate].contains(idActivity))
        ? true
        : false;
  }

  void onChangeCheck(String idActivity) {
    if (_checkedIdActivities.containsKey(_selectedDate)) {
      final list = _checkedIdActivities[_selectedDate];
      (list.contains(idActivity))
          ? list.remove(idActivity)
          : list.add(idActivity);
    } else {
      _checkedIdActivities[_selectedDate] = <String>[idActivity];
    }
    notifyListeners();
  }

  void saveChecked(List<Activity> list) {
    _listGoals[_selectedDate] = list;
    notifyListeners();
  }

  removeChecked(String idActivity) {
    if (_listGoals.containsKey(_selectedDate)) {
      final list = _listGoals[_selectedDate];
      list.removeWhere((element) => element.id == idActivity);
      _listGoals[_selectedDate] = list;
    }
    if (_checkedIdActivities.containsKey(_selectedDate)) {
      _checkedIdActivities[_selectedDate].remove(idActivity);
    }
    notifyListeners();
  }

  void changeSelectedDate(DateTime date) {
    _selectedDate = DateFormat(formatDate).format(date);
    notifyListeners();
  }

  List<Activity> getGoalsByDate({String date}) {
    final String searchDate = date ?? _selectedDate;
    return (_listGoals.containsKey(searchDate)) ? _listGoals[searchDate] : [];
  }
}
