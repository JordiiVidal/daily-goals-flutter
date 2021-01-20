import 'package:daily_goals/presentation/routes/app_routes.dart';
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
        onTap: () => Navigator.pushNamed(
          context,
          AppRoutes.taskDetails,
          arguments: task,
        ),
        title: Text(task.name),
        trailing: Icon(
          Icons.chevron_right,
          color: AppColors.secondaryTextColor,
        ),
      ),
    );
  }
}
