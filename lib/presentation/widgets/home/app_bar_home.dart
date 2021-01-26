import 'package:daily_goals/presentation/providers/main_providert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';
import '../../helpers.dart';
import '../bottom_sheet_calendar.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key key}) : super(key: key);

  void _showModalBottomSheetCalendar(BuildContext context) {
    final goalProvider = context.read<MainProvider>();
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
      padding: EdgeInsets.only(top: _statusBarHeight + 15, bottom: 15),
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
            child: Container(
              child: Text(
                Formatter.momentDay(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
    );
  }
}
