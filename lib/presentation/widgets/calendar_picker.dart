import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/presentation/widgets/bottom_sheet_calendar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarPicker extends StatelessWidget {
  const CalendarPicker({Key key}) : super(key: key);

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
        return BottomSheetCalendar(closeOnClick: true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _showModalBottomSheetCalendar(context),
          ),
          Text(
            context.watch<GoalProvider>().selectedDateText,
          )
        ],
      ),
    );
  }
}
