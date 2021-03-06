import 'package:daily_goals/presentation/providers/main_providert.dart';
import 'package:daily_goals/presentation/widgets/empty_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';
import '../goal/goal_item_list.dart';
import '../../helpers.dart';

class HomeGoalList extends StatelessWidget {
  const HomeGoalList();

  @override
  Widget build(BuildContext context) {
    final goalProvider = context.watch<MainProvider>();
    final SlidableController slidableController = SlidableController();

    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tasks',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              Text(
                Formatter.ui(goalProvider.selectedDate),
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ],
          ),
          Expanded(
            child: (goalProvider.goalsList.length > 0)
                ? ListView.builder(
                    padding: const EdgeInsets.only(top: 12),
                    physics: BouncingScrollPhysics(),
                    itemCount: goalProvider.goalsList.length,
                    itemBuilder: (_, i) => GoalItemList(
                      goal: goalProvider.goalsList[i],
                      slidableController: slidableController,
                    ),
                  )
                : EmptyList(),
          ),
        ],
      ),
    );
  }
}
