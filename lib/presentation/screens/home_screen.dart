import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/custom_bottom_navigation.dart';
import 'package:daily_goals/presentation/widgets/custom_drawer.dart';
import 'package:daily_goals/presentation/widgets/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:daily_goals/presentation/widgets/app_bar_home.dart';
import 'package:daily_goals/presentation/widgets/goal/goal_item_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final goalProvider = context.watch<GoalProvider>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarHome(),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Formatter.momentDay(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 40,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  Text(
                    Formatter.ui(goalProvider.selectedDate),
                    style: TextStyle(color: AppColors.secondaryTextColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 8),
                  physics: BouncingScrollPhysics(),
                  itemCount: goalProvider.goalsList.length,
                  itemBuilder: (_, i) =>
                      GoalItemList(goalProvider.goalsList[i]),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
