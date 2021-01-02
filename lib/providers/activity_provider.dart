import 'package:daily_goals/models/activity.dart';
import 'package:flutter/cupertino.dart';

class ActivityProvider extends ChangeNotifier {
  final List<Activity> _activitiesList = [];

  List<Activity> get activitiesList => _activitiesList;

  void addActivity(Activity activity) {
    _activitiesList.add(activity);
    notifyListeners();
  }

  List<Activity> getByListId(List<String> listId) {
    List<Activity> list = [];
    listId.forEach((idActivity) {
      final activity =
          _activitiesList.firstWhere((element) => element.id == idActivity);
      list.add(activity);
    });
    return list;
  }

  Activity getById(String id) =>
      _activitiesList.firstWhere((element) => element.id == id);

  removeById(String id) {
    _activitiesList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
