import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';
import '../bottom_sheet_calendar.dart';
import '../goal/goal_item_list.dart';
import '../../helpers.dart';

class HomeGoalList extends StatelessWidget {
  const HomeGoalList({Key key}) : super(key: key);
  void _showModalBottomSheetCalendar(BuildContext context) {
    final goalProvider = context.read<GoalProvider>();
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
    final goalProvider = context.watch<GoalProvider>();

    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tasks',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              GestureDetector(
                onTap: () => _showModalBottomSheetCalendar(context),
                child: Text(
                  Formatter.ui(goalProvider.selectedDate),
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 12),
              physics: BouncingScrollPhysics(),
              itemCount: goalProvider.goalsList.length,
              itemBuilder: (_, i) => GoalItemList(goalProvider.goalsList[i]),
            ),
          ),
        ],
      ),
    );
  }
}