import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BottomSheetCalendar extends StatelessWidget {
  final bool closeOnClick;
  final DateTime focusedDay;
  final Function onDaySelected;
  const BottomSheetCalendar({
    @required this.focusedDay,
    @required this.onDaySelected,
    closeOnClick,
  }) : this.closeOnClick = closeOnClick ?? false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: TableCalendar(
          firstDay: DateTime.utc(2010, 1, 1),
          focusedDay: focusedDay,
          lastDay: DateTime.now().add(Duration(days: 365)),
          currentDay: DateTime.now(),
          startingDayOfWeek: StartingDayOfWeek.monday,
          selectedDayPredicate: (day) {
            return isSameDay(focusedDay, day);
          },
          onDaySelected: (da, l) {
            onDaySelected(da);
            if (closeOnClick) Navigator.pop(context);
          },
          calendarStyle: CalendarStyle(
            isTodayHighlighted: true,
            defaultTextStyle: TextStyle(
              color: Colors.black87,
              fontSize: 17,
            ),
            weekendTextStyle: TextStyle(
              color: Colors.black38,
              fontSize: 17,
            ),
            outsideTextStyle: TextStyle(
              color: Colors.black38,
              fontSize: 17,
            ),
          ),
          availableCalendarFormats: {CalendarFormat.month: 'Month'},
          headerStyle: HeaderStyle(
            titleCentered: true,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
            leftChevronPadding: const EdgeInsets.all(0.0),
            rightChevronPadding: const EdgeInsets.all(0.0),
            leftChevronMargin: const EdgeInsets.all(0.0),
            rightChevronMargin: const EdgeInsets.all(0.0),
            headerPadding: const EdgeInsets.only(bottom: 25.0),
            headerMargin: const EdgeInsets.all(0.0),
          ),
        ),
      ),
    );
  }
}
