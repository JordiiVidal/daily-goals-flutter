import 'package:daily_goals/presentation/providers/task_provider.dart';
import 'package:flutter/material.dart';

import 'package:daily_goals/presentation/widgets/bottom_sheet_calendar.dart';
import 'package:daily_goals/presentation/widgets/task_search_delegate.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key key}) : super(key: key);

  void _showModalBottomSheetCalendar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return BottomSheetCalendar();
      },
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              Icons.sort,
              size: 28,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                IconButton(
                  icon: Icon(
                    Icons.calendar_today,
                    size: 25,
                  ),
                  onPressed: () => _showModalBottomSheetCalendar(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
