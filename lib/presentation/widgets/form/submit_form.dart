import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/domain/models/task_model.dart';
import 'package:daily_goals/presentation/providers/form_provider.dart';
import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/presentation/providers/task_provider.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class SubmitForm extends StatelessWidget {
  const SubmitForm({Key key}) : super(key: key);

  void onSubmit(BuildContext context) async {
    final formModel = context.read<FormProvider>().formState;
    final task = TaskModel.fromForm(formModel);
    await context.read<TaskProvider>().createTask(task);
    final goal = GoalModel.fromForm(formModel, task.id);
    await context.read<GoalProvider>().createGoal(goal);
    print('ole');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSubmit(context),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            'Create Task',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
