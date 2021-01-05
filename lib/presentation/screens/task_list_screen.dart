import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:daily_goals/presentation/providers/task_provider.dart';

import '../widgets/task_item_list.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen();
  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => null,
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.createTask),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: taskProvider.tasksList.length,
          itemBuilder: (_, i) => TaskItemList(
            task: taskProvider.tasksList[i],
            onDismiss: taskProvider.deleteById,
          ),
        ),
      ),
    );
  }
}
