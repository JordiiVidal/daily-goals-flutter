import 'package:daily_goals/presentation/theme.dart';
import 'package:daily_goals/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:daily_goals/presentation/widgets/app_bar_home.dart';
import 'package:daily_goals/presentation/widgets/goal_item_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  String timeOfDay() {
    var timeNow = DateTime.now().hour;
    if (timeNow <= 12) {
      return 'Good Morning';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good Afternoon';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    final goalProvider = context.watch<GoalProvider>();
    return Scaffold(
      drawer: CustomDrawer(),
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
                    timeOfDay(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryTextColor),
                  ),
                  Text(
                    goalProvider.selectedDateText,
                    style: TextStyle(color: AppColors.secondaryTextColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: (goalProvider.goalsDate.isNotEmpty)
                    ? ListView.builder(
                        padding: const EdgeInsets.only(top: 8),
                        physics: BouncingScrollPhysics(),
                        itemCount: goalProvider.goalsDate.length,
                        itemBuilder: (_, i) {
                          return GoalItemList(
                            goal: goalProvider.goalsDate[i],
                            isFirst: i == 0 ? true : false,
                            isLast: i == goalProvider.goalsDate.length - 1
                                ? true
                                : false,
                          );
                        },
                      )
                    : Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              'Hey\nyou are\nfree today',
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 6,
        onPressed: () => Navigator.pushNamed(context, AppRoutes.createTask),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
