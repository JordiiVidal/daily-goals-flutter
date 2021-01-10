import 'package:daily_goals/domain/models/task_model.dart';
import 'package:daily_goals/presentation/providers/task_provider.dart';
import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/button_task.dart';
import 'package:daily_goals/presentation/widgets/task_item_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchTaskList extends StatelessWidget {
  final String query;
  const SearchTaskList(this.query);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TaskModel>>(
      future: Provider.of<TaskProvider>(context).searchListTasks(query),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final List<TaskModel> list = snapshot.data;
          if (list.length == 0 && query.isNotEmpty) {
            return Center(
              child: Text('No results'),
            );
          } else if (list.length == 0 && query.isEmpty) {
            return Column(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'No task created',
                      style: TextStyle(
                        fontSize: 30,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.all(20.0),
                  child: ButtonTask(),
                ),
              ],
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(top: 8),
            physics: BouncingScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (_, i) => TaskItemList(list[i]),
          );
        }
        return Center(
          child: Text('Loading ...'),
        );
      },
    );
  }
}
