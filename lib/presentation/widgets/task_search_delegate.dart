import 'package:daily_goals/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/domain/models/task_model.dart';
import 'package:daily_goals/presentation/providers/task_provider.dart';
import 'package:daily_goals/presentation/widgets/task_item_list.dart';

class TaskSearchDelegate extends SearchDelegate<TaskModel> {
  @override
  List<Widget> buildActions(BuildContext context) => [
        if (query != '')
          Center(
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: AppColors.secondaryTextColor,
              ),
              onPressed: () {
                query = '';
              },
            ),
          ),
      ];

  @override
  Widget buildLeading(BuildContext context) => Center(
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.secondaryTextColor,
          ),
          onPressed: () => this.close(context, null),
        ),
      );

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<TaskModel>>(
      future: Provider.of<TaskProvider>(context).searchListTasks(query),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final List<TaskModel> list = snapshot.data;
          return ListView.builder(
            padding: const EdgeInsets.only(top: 8),
            physics: BouncingScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (_, i) => TaskItemList(list[i]),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      physics: BouncingScrollPhysics(),
      itemCount: taskProvider.tasksList.length,
      itemBuilder: (_, i) => TaskItemList(taskProvider.tasksList[i]),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: AppColors.secondaryColor,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: AppColors.secondaryTextColor,
        ),
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.primaryTextColor,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppColors.secondaryTextColor,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
