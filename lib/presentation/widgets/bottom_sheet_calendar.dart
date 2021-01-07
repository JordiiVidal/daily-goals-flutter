import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class BottomSheetCalendar extends StatefulWidget {
  final bool closeOnClick;
  const BottomSheetCalendar({closeOnClick})
      : this.closeOnClick = closeOnClick ?? false;

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
        padding: const EdgeInsets.all(20.0),
        child: TableCalendar(
          calendarController: _calendarController,
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarStyle: CalendarStyle(
            highlightToday: true,
            contentPadding: const EdgeInsets.all(5),
            selectedColor: AppColors.accentColor,
            cellMargin: const EdgeInsets.all(5),
            todayColor: Colors.grey[200],
            todayStyle: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 18,
            ),
            weekdayStyle: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 18,
            ),
          ),
          initialSelectedDay: context.watch<GoalProvider>().selectedDate,
          onDaySelected: (da, l, ls) async {
            await context.read<GoalProvider>().changeSelectedDate(da);
            if (widget.closeOnClick) Navigator.pop(context);
          },
          availableCalendarFormats: {
            CalendarFormat.month: 'Month',
          },
          headerStyle: HeaderStyle(
            centerHeaderTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
