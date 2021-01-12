import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/presentation/theme.dart';
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
          GestureDetector(
            onTap: () => _showModalBottomSheetCalendar(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: AppColors.secondaryTextColor,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 17,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    context.watch<GoalProvider>().selectedDateyMd,
                    style: TextStyle(
                      color: AppColors.secondaryTextColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => _showModalBottomSheetCalendar(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: AppColors.secondaryTextColor,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.timer,
                    size: 17,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    context.watch<GoalProvider>().selectedDateyMd,
                    style: TextStyle(
                      color: AppColors.secondaryTextColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
