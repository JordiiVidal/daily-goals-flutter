import 'package:daily_goals/providers/goals_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  static const routeName = '/calendar';
  const CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Container(
        child: TableCalendar(
          calendarController: _calendarController,
          initialSelectedDay:
              Provider.of<GoalsProvider>(context).selectDateTime,
          onDaySelected: (da, l, ls) =>
              Provider.of<GoalsProvider>(context, listen: false)
                  .changeSelectedDate(da),
          availableCalendarFormats: {CalendarFormat.month: 'Month'},
          headerStyle: HeaderStyle(
            centerHeaderTitle: true,
          ),
        ),
      ),
    );
  }
}
