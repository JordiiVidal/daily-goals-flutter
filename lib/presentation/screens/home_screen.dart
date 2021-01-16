import 'package:flutter/material.dart';

import '../widgets/home/home_category_list.dart';
import '../widgets/home/home_goal_list.dart';
import '../widgets/home/app_bar_home.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarHome(),
            HomeCategoryList(),
            HomeGoalList(),
          ],
        ),
      ),
    );
  }
}
