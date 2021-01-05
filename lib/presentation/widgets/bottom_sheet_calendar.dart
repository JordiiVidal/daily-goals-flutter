import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class BottomSheetCalendar extends StatefulWidget {
  const BottomSheetCalendar();

  @override
  _BottomSheetCalendarState createState() => _BottomSheetCalendarState();
}

class _BottomSheetCalendarState extends State<BottomSheetCalendar> {
  var _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
          ),
        ),
        child: TableCalendar(
          calendarController: _calendarController,
          initialSelectedDay:
              context.watch<GoalProvider>().selectedDate,
          onDaySelected: (da, l, ls) =>
               context.read<GoalProvider>().changeSelectedDate(da),
          availableCalendarFormats: {CalendarFormat.month: 'Month'},
          headerStyle: HeaderStyle(
            centerHeaderTitle: true,
          ),
        ),
      ),
    );
  }
}
