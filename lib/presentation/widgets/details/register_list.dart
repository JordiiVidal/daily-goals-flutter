import 'package:daily_goals/domain/models/goal_model.dart';
import 'package:daily_goals/presentation/providers/task_details_provider.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers.dart';

class RegisterList extends StatelessWidget {
  const RegisterList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final register = context.watch<TaskDetailsProvider>().register;
    return ListView.builder(
      itemCount: register.length,
      itemBuilder: (_, i) => Container(
        color: AppColors.primaryColor,
        child: ListTile(
          title: Text(register[i].task.name),
          subtitle: Text(
            statusToString(register[i].status),
            style: TextStyle(
              color: register[i].status == Status.Done
                  ? AppColors.secondaryAccentColor
                  : AppColors.accentColor,
            ),
          ),
          trailing: Container(
            child: Column(
              children: [
                Text(
                  Formatter.ui(register[i].date),
                  style: TextStyle(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
