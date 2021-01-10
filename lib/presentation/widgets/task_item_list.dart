import 'package:daily_goals/presentation/theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/presentation/providers/goal_providert.dart';

import '../../domain/models/task_model.dart';

class TaskItemList extends StatelessWidget {
  final TaskModel task;
  const TaskItemList(this.task);

  void createGoal(BuildContext context) async {
    final goal = GoalModel(
      idTask: task.id,
      date: context.read<GoalProvider>().selectedDateString,
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
      ),
    );
  }
}
