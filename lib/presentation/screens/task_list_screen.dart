import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:daily_goals/presentation/providers/task_provider.dart';

import '../widgets/task_item_list.dart';

class TaskListScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.createTask),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => context.read<TaskProvider>().deleteAllTasks(),
          )
        ],
      ),
      body: Container(
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
