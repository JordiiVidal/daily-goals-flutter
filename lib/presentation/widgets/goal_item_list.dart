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
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10,
        ),
        onTap: () => context.read<GoalProvider>().updateStatus(
              goal.id,
              goal.status == Status.Pending ? Status.Done : Status.Pending,
            ),
        leading: goal.status == Status.Pending
            ? Icon(
                Icons.panorama_fish_eye,
                color: AppColors.accentColor,
              )
            : Icon(
                Icons.check,
                color: AppColors.secondaryAccentColor,
              ),
        title: Text(
          '  ${goal.task.name}  ',
          style: TextStyle(
            fontSize: 18,
            decoration: (goal.status == Status.Done)
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
          softWrap: false,
          maxLines: 1,
          overflow: TextOverflow.fade,
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.chevron_right,
            color: AppColors.secondaryTextColor,
          ),
          onPressed: () => print('dasda'),
        ),
      ),
    );
  }
}
