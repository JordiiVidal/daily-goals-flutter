import 'package:daily_goals/presentation/widgets/details/details.dart';
import 'package:daily_goals/presentation/widgets/details/register_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/domain/models/task_model.dart';
import 'package:daily_goals/domain/repositories/goal_repository.dart';
import 'package:daily_goals/presentation/providers/task_details_provider.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context).settings.arguments as TaskModel;
    return ChangeNotifierProvider(
      create: (ctx) => TaskDetailsProvider(
        goalRI: ctx.read<GoalRepositoryInterface>(),
        task: task,
      )..loadDetails(),
      builder: (context, __) => Scaffold(
        appBar: AppBar(
          title: Text(task.name),
        ),
        body: Column(
          children: [
            Details(),
            Expanded(child: RegisterList()),
          ],
        ),
      ),
    );
  }
}
