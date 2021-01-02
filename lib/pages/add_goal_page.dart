import 'package:daily_goals/providers/activity_provider.dart';
import 'package:daily_goals/providers/goals_provider.dart';
import 'package:daily_goals/widgets/checkbox_activity_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddGoalPage extends StatelessWidget {
  static const routeName = '/add-goal';
  const AddGoalPage({Key key}) : super(key: key);

  void onTapSaveList(BuildContext context) {
    final provider = Provider.of<GoalsProvider>(context, listen: false);
    final listId = provider.checkedSelectedIdActivities;
    final activities = Provider.of<ActivityProvider>(context, listen: false)
        .getByListId(listId);
    provider.saveChecked(activities);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Goals'),
      ),
      body: Consumer<ActivityProvider>(
        builder: (_, provider, child) {
          return Stack(
            children: [
              ListView.builder(
                itemCount: provider.activitiesList.length,
                itemBuilder: (_, i) => CheckBoxActivityItem(
                  activity: provider.activitiesList[i],
                ),
              ),
              Positioned(
                bottom: 30,
                left: 30,
                right: 30,
                child: GestureDetector(
                  onTap: () => onTapSaveList(context),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 60,
                    height: 70,
                    color: Colors.red,
                    child: Center(child: Text('Save List')),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
