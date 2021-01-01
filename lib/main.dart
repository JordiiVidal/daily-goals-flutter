import 'pages/activities_page.dart';
import 'pages/activity_page.dart';
import 'pages/add_activity.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day Goals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: ActivitiesPage.routeName,
      routes: {
        ActivitiesPage.routeName: (_) => ActivitiesPage(),
        ActivityPage.routeName: (_) => ActivityPage(),
        AddActivityPage.routeName: (_) => AddActivityPage(),
      },
    );
  }
}
