import 'package:daily_goals/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/domain/models/goal_model.dart';

class GoalItemList extends StatelessWidget {
  final GoalModel goal;
  final bool isLast;
  final bool isFirst;
  const GoalItemList({this.goal, isLast, isFirst})
      : this.isLast = isLast ?? false,
        this.isFirst = isFirst ?? false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
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
        title: Text(
          '  ${goal.task.name}  ',
          style: TextStyle(
            fontSize: 18,
            decoration: (goal.status == Status.Done)
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          '${goal.task.exigency.index}',
        ),
      ),
    );
  }
}
