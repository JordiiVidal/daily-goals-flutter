import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/domain/models/task_model.dart';
import 'package:daily_goals/presentation/providers/task_provider.dart';
import 'package:daily_goals/presentation/widgets/task_item_list.dart';

class TaskSearchDelegate extends SearchDelegate<TaskModel> {
  @override
  List<Widget> buildActions(BuildContext context) => [
        Center(
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: null,
          ),
        )
      ];

  @override
  Widget buildLeading(BuildContext context) => Center(
        child: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => this.close(context, null),
        ),
      );

  @override
  Widget buildResults(BuildContext context) => Text('Build Results');

  @override
  Widget buildSuggestions(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    return ListView.builder(
      itemCount: taskProvider.tasksList.length,
      itemBuilder: (_, i) => TaskItemList(
        task: taskProvider.tasksList[i],
        onDismiss: taskProvider.deleteById,
      ),
    );
  }
}
