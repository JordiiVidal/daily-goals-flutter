import 'package:daily_goals/models/activity.dart';
import 'package:flutter/cupertino.dart';

class ActivityProvider extends ChangeNotifier {
  final List<Activity> _activitiesList = [];

  List<Activity> get activitiesList => _activitiesList;

  void addActivity(Activity activity) {
    _activitiesList.add(activity);
    notifyListeners();
  }

  Activity getById(String id) =>
      _activitiesList.firstWhere((element) => element.id == id);

  void removeById(String id) {
    _activitiesList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
