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

  void _showModalBottomSheetCalendar(BuildContext context) {
    final goalProvider = context.read<GoalProvider>();
    showModalBottomSheet(
      context: context,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      builder: (context) => BottomSheetCalendar(
        onDaySelected: goalProvider.setSelectedDate,
        initDateTime: goalProvider.selectedDate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(top: _statusBarHeight),
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                child: Icon(
                  Icons.calendar_today,
                  size: 25,
                ),
                onTap: () => _showModalBottomSheetCalendar(context),
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
