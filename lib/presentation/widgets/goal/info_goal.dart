import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';
import '../../helpers.dart';

class InfoGoal extends StatelessWidget {
  final GoalModel goalModel;
  const InfoGoal(this.goalModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            Formatter.ui(goalModel.time, time: true),
            style: TextStyle(
              color: AppColors.secondaryTextColor,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 3.0),
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: goalModel.task.priority.index >= 0
                      ? AppColors.accentColor
                      : AppColors.secondaryTextColor,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 3),
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: goalModel.task.priority.index >= 1
                      ? AppColors.accentColor
                      : AppColors.secondaryTextColor,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 3),
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: goalModel.task.priority.index == 2
                      ? AppColors.accentColor
                      : AppColors.secondaryTextColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
