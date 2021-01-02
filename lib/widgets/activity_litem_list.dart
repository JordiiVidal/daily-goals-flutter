import 'package:daily_goals/providers/activity_provider.dart';

import '../models/activity.dart';
import '../pages/activity_page.dart';
import 'package:flutter/material.dart';

class ActivityItemList extends StatelessWidget {
  final Activity activity;
  final ActivityProvider provider;
  const ActivityItemList({Key key, this.activity, this.provider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Dismissible(
        movementDuration: Duration(seconds: 2),
        direction: DismissDirection.endToStart,
        key: Key(activity.id),
        onDismissed: (direction) => provider.removeById(activity.id),
        background: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('DELETE'),
                const SizedBox(width: 20),
                Icon(
                  Icons.delete,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
        child: Card(
          margin: const EdgeInsets.all(0.0),
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
      ),
    );
  }
}
