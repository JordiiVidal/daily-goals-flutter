import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:provider/provider.dart';

import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/presentation/providers/goal_providert.dart';

import '../../domain/models/task_model.dart';

class TaskItemList extends StatelessWidget {
  final TaskModel task;
  final Function onDismiss;
  const TaskItemList({this.task, this.onDismiss});

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Card(
          margin: const EdgeInsets.all(0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: ListTile(
              onTap: () => createGoal(context),
              title: Text(task.name),
              trailing: Text('${task.exigency.index}'),
            ),
          ),
        ),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Delete',
            color: Colors.redAccent,
            icon: Icons.delete,
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
