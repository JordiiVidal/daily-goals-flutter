import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_goals/presentation/providers/goal_providert.dart';
import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:daily_goals/presentation/widgets/bottom_sheet_calendar.dart';
import 'package:daily_goals/presentation/widgets/home_app_bar.dart';
import 'package:daily_goals/presentation/widgets/goal_item_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final goalProvider = context.watch<GoalProvider>();
    return Scaffold(
      backgroundColor: Color(0xffF4F6FD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: HomeAppBar(),
          ),
          Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: goalProvider.goalsDate.length,
                itemBuilder: (_, i) {
                  return GoalItemList(
                    goal: goalProvider.goalsDate[i],
                    isFirst: i == 0 ? true : false,
                    isLast:
                        i == goalProvider.goalsDate.length - 1 ? true : false,
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 6,
        onPressed: () => Navigator.pushNamed(context, AppRoutes.tasks),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
