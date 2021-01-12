import 'package:daily_goals/presentation/widgets/form/item_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/presentation/providers/goal_providert.dart';

import '../bottom_sheet_calendar.dart';

class DateTimePicker extends StatelessWidget {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose date & time',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          child: Row(
            children: [
              ItemPicker(
                onTap: () => _showModalBottomSheetCalendar(context),
                iconData: Icons.calendar_today,
                text: context.watch<GoalProvider>().selectedDateyMd,
              ),
              SizedBox(
                width: 10,
              ),
              ItemPicker(
                onTap: () => _showModalBottomSheetCalendar(context),
                iconData: Icons.timer,
                text: 'Select Time',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
