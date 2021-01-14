import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/presentation/widgets/bottom_sheet_calendar.dart';
import 'package:daily_goals/presentation/widgets/search/search_task_delegate.dart';

import '../theme.dart';
import 'helpers.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(top: _statusBarHeight + 15, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              child: Text(
                Formatter.momentDay(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              size: 25,
            ),
            onPressed: () => showSearch(
              context: context,
              delegate: TaskSearchDelegate(),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            child: Icon(
              Icons.add,
              size: 25,
            ),
            onTap: () => Navigator.pushNamed(context, AppRoutes.form),
          ),
        ],
      ),
    );
  }
}
