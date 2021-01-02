import 'package:daily_goals/providers/goals_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class BottomSheetCalendar extends StatefulWidget {
  const BottomSheetCalendar({Key key}) : super(key: key);

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
      child: TableCalendar(
        calendarController: _calendarController,
        initialSelectedDay: Provider.of<GoalsProvider>(context).selectDateTime,
        onDaySelected: (da, l, ls) =>
            Provider.of<GoalsProvider>(context, listen: false)
                .changeSelectedDate(da),
        availableCalendarFormats: {CalendarFormat.month: 'Month'},
        headerStyle: HeaderStyle(
          centerHeaderTitle: true,
        ),
      ),
    );
  }
}
