import '../models/activity.dart';

List<Activity> activities = [
  Activity(name: 'Wake Up at 8:30 am'),
  Activity(name: 'Breakfast'),
  Activity(name: 'Study English'),
  Activity(name: 'Go GYM'),
  Activity(name: 'Check StackOverflow'),
];

Activity activityById(String id) =>
    activities.firstWhere((activity) => activity.id == id);

void addActivity(Activity activity) => activities.add(activity);
