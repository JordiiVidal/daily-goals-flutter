import '../models/activity.dart';
import '../pages/activity_page.dart';
import 'package:flutter/material.dart';

class ActivityItemList extends StatelessWidget {
  final Activity activity;
  final Function onDismiss;
  const ActivityItemList({Key key, this.activity, this.onDismiss})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Dismissible(
        movementDuration: Duration(seconds: 2),
        direction: DismissDirection.endToStart,
        key: Key(activity.id),
        onDismissed: (direction) => onDismiss(activity.id),
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
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
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
