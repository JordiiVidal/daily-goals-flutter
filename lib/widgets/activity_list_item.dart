import '../models/activity.dart';
import '../pages/activity_page.dart';
import 'package:flutter/material.dart';

class ActivityListItem extends StatelessWidget {
  final Activity activity;
  const ActivityListItem({Key key, this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.pushNamed(
          context,
          ActivityPage.routeName,
          arguments: activity.id,
        ),
        title: Text(activity.name),
        trailing: Text('${activity.exigency.index}'),
      ),
    );
  }
}
