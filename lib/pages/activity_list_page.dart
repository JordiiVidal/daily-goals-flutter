import 'package:flutter/material.dart';

import 'package:daily_goals/providers/activity_provider.dart';
import 'package:provider/provider.dart';

import 'add_activity_page.dart';
import '../widgets/activity_litem_list.dart';

class ActivityListPage extends StatelessWidget {
  static const routeName = '/list-activites';
  const ActivityListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activities'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ActivityProvider>(
          builder: (_, provider, child) {
            return ListView.builder(
              itemCount: provider.activitiesList.length,
              itemBuilder: (_, i) => ActivityItemList(
                activity: provider.activitiesList[i],
                provider: provider,
              ),
            );
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
