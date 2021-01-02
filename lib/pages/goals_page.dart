import 'package:daily_goals/models/activity.dart';
import 'package:daily_goals/pages/calendar_page.dart';
import 'package:daily_goals/widgets/activity_litem_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/activity_list_page.dart';
import '../pages/add_goal_page.dart';
import '../providers/goals_provider.dart';

class GoalsPage extends StatelessWidget {
  static const routeName = '/goals';
  const GoalsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goals'),
        actions: [
          IconButton(
            icon: const Icon(Icons.library_books),
            onPressed: () =>
                Navigator.pushNamed(context, ActivityListPage.routeName),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () =>
                Navigator.pushNamed(context, AddGoalPage.routeName),
          ),
        ],
      ),
      body: Consumer<GoalsProvider>(
        builder: (_, provider, child) {
          final List<Activity> list = provider.getGoalsByDate();
          return Column(
            children: [
              Text(provider.selectedDate),
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, i) {
                    return ActivityItemList(
                      activity: list[i],
                      onDismiss: provider.removeChecked,
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, CalendarPage.routeName),
        child: const Icon(Icons.calendar_today),
      ),
    );
  }
}
