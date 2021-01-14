import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/custom_bottom_navigation.dart';
import 'package:daily_goals/presentation/widgets/helpers.dart';

import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/presentation/widgets/app_bar_home.dart';
import 'package:daily_goals/presentation/widgets/goal/goal_item_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final goalProvider = context.watch<GoalProvider>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarHome(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tasks',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.primaryTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  Formatter.ui(goalProvider.selectedDate),
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.secondaryTextColor,
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
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
