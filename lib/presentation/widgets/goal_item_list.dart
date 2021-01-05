import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/presentation/providers/goal_providert.dart';

class GoalItemList extends StatelessWidget {
  final GoalModel goal;
  final Function onDismiss;

  const GoalItemList({Key key, this.goal, this.onDismiss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Dismissible(
        movementDuration: Duration(seconds: 2),
        direction: DismissDirection.endToStart,
        key: Key(goal.id),
        onDismissed: (direction) => onDismiss(goal.id),
        background: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlineButton(
                  onPressed: () => null,
                  child: Text(
                    'Delete',
                  ),
                ),
              ],
            ),
          ),
        ),
        child: Card(
          margin: const EdgeInsets.all(0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: ListTile(
              onTap: () => null,
              leading:  Text('${goal.status.index}'),
              title: Text(goal.task.name),
              trailing: Text('${goal.task.exigency.index}'),
            ),
          ),
        ),
      ),
    );
  }
}
