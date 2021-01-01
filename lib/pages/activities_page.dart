import '../data/state.dart';
import '../pages/add_activity.dart';
import '../widgets/activity_list_item.dart';
import 'package:flutter/material.dart';

class ActivitiesPage extends StatelessWidget {
  static const routeName = '/list-activites';
  const ActivitiesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activities'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: activities.length,
          itemBuilder: (_, i) {
            return ActivityListItem(activity: activities[i]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            Navigator.pushNamed(context, AddActivityPage.routeName),
      ),
    );
  }
}
