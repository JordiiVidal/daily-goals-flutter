import '../data/state.dart';
import '../models/activity.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  static const routeName = '/profile-activity';
  const ActivityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String idActivity =
        ModalRoute.of(context).settings.arguments as String;
    final Activity activity = activityById(idActivity);
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.name),
      ),
    );
  }
}
