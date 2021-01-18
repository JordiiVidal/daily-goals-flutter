import 'package:flutter/material.dart';

import 'package:daily_goals/presentation/theme.dart';

import '../../../domain/models/task_model.dart';

class SearchTaskItem extends StatelessWidget {
  final TaskModel task;
  const SearchTaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primaryColor,
      ),
      child: ListTile(
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
