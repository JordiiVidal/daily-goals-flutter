import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/goal/info_goal.dart';
import 'package:daily_goals/presentation/providers/main_providert.dart';
import 'package:daily_goals/domain/models/goal_model.dart';

class GoalItemList extends StatelessWidget {
  final GoalModel goal;
  final SlidableController slidableController;
  const GoalItemList({this.goal, this.slidableController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Slidable(
        key: Key(goal.id),
        controller: slidableController,
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: [
          GestureDetector(
            onTap: () => context.read<MainProvider>().deleteGoalById(goal.id),
            child: Container(
              margin: const EdgeInsets.only(
                left: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.red[600],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
          ),
        ],
        child: GestureDetector(
          onTap: () => context.read<MainProvider>().updateStatus(
                goal.id,
                goal.status == Status.Pending ? Status.Done : Status.Pending,
              ),
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
                Padding(
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
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
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
                ),
                InfoGoal(goal),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
