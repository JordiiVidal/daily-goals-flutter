import 'package:daily_goals/providers/activity_provider.dart';

import '../models/activity.dart';
import '../pages/activity_page.dart';
import 'package:flutter/material.dart';

class ActivityItemList extends StatelessWidget {
  final Activity activity;
  final ActivityProvider provider;
  const ActivityItemList({Key key, this.activity, this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(activity.id),
      onDismissed: (direction) => provider.removeById(activity.id),
      background: Card(
        child: Container(
          color: Colors.redAccent[100],
        ),
      ),
      child: Card(
        child: ListTile(
          onTap: () => Navigator.pushNamed(
            context,
            ActivityPage.routeName,
            arguments: activity.id,
          ),
          title: Text(activity.name),
          trailing: Text('${activity.exigency.index}'),
        ),
      ),
    );
  }
}
