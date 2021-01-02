import 'package:daily_goals/pages/add_goal_page.dart';
import 'package:daily_goals/pages/calendar_page.dart';
import 'package:daily_goals/pages/goals_page.dart';
import 'package:daily_goals/providers/activity_provider.dart';
import 'package:daily_goals/providers/goals_provider.dart';
import 'package:provider/provider.dart';

import 'pages/activity_list_page.dart';
import 'pages/activity_page.dart';
import 'pages/add_activity_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ActivityProvider>(
            create: (_) => ActivityProvider()),
        ChangeNotifierProvider<GoalsProvider>(create: (_) => GoalsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daily Goals',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: GoalsPage.routeName,
        routes: {
          GoalsPage.routeName: (_) => GoalsPage(),
          AddGoalPage.routeName: (_) => AddGoalPage(),
          ActivityListPage.routeName: (_) => ActivityListPage(),
          ActivityPage.routeName: (_) => ActivityPage(),
          AddActivityPage.routeName: (_) => AddActivityPage(),
          CalendarPage.routeName: (_) => CalendarPage(),
        },
      ),
    );
  }
}
