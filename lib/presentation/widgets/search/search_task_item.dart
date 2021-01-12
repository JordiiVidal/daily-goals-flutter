import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:daily_goals/presentation/theme.dart';

import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/presentation/providers/goal_providert.dart';
import '../../../domain/models/task_model.dart';


class SearchTaskItem extends StatelessWidget {
  final TaskModel task;
  const SearchTaskItem(this.task);

  void createGoal(BuildContext context) async {
    final goal = GoalModel(
      idTask: task.id,
      date: DateTime.now(),
    );
    await context.read<GoalProvider>().createGoal(goal);

    ///Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primaryColor,
      ),
      child: ListTile(
        leading: IconButton(
          icon: Icon(
            Icons.add,
            color: AppColors.secondaryAccentColor,
          ),
          onPressed: () => createGoal(context),
        ),
        title: Text(task.name),
        trailing: IconButton(
          icon: Icon(
            Icons.chevron_right,
            color: AppColors.secondaryTextColor,
          ),
          onPressed: () => print('not yet'),
        ),
      ),
    );
  }
}
