import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/domain/models/goal_model.dart';

class GoalItemList extends StatelessWidget {
  final GoalModel goal;
  const GoalItemList({Key key, this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        margin: const EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: ListTile(
            onTap: () => context.read<GoalProvider>().updateStatus(
                  goal.id,
                  goal.status == Status.Pending ? Status.Done : Status.Pending,
                ),
            leading: goal.status == Status.Pending
                ? Icon(Icons.check_box_outline_blank)
                : Icon(Icons.check),
            title: Text(goal.task.name),
            trailing: Text('${goal.task.exigency.index}'),
          ),
        ),
      ),
    );
  }
}
