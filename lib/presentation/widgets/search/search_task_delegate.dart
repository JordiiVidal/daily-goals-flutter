import 'package:flutter/material.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/search/search_task_list.dart';

import 'package:daily_goals/domain/models/task_model.dart';

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
  Widget buildResults(BuildContext context) => SearchTaskList(query);

  @override
  Widget buildSuggestions(BuildContext context) => SearchTaskList(query);

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
