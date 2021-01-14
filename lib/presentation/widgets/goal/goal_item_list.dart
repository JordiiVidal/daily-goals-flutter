import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/goal/custom_trailing.dart';
import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/domain/models/goal_model.dart';

class GoalItemList extends StatelessWidget {
  final GoalModel goal;
  const GoalItemList(this.goal);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Slidable(
        key: UniqueKey(),
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: [
          GestureDetector(
            onTap: () => context.read<GoalProvider>().deleteGoalById(goal.id),
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: const Text('Delete'),
            ),
          ),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => context.read<GoalProvider>().updateStatus(
                      goal.id,
                      goal.status == Status.Pending
                          ? Status.Done
                          : Status.Pending,
                    ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    goal.status == Status.Pending
                        ? Icons.panorama_fish_eye
                        : Icons.check,
                    color: goal.status == Status.Pending
                        ? AppColors.accentColor
                        : AppColors.secondaryAccentColor,
                  ),
                ),
              ),
              Expanded(
                child: Text(
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
              ),
              CustomTrailing(goal),
            ],
          ),
        ),
      ),
    );
  }
}
