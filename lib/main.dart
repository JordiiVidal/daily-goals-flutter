import 'package:daily_goals/data/repositories/goal_repository_impl.dart';
import 'package:daily_goals/presentation/providers/task_provider.dart';
import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:daily_goals/presentation/screens/form_screen.dart';
import 'package:daily_goals/presentation/screens/details_task_screen.dart';
import 'package:daily_goals/presentation/screens/home_screen.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'data/repositories/task_repositorty_impl.dart';
import 'domain/repositories/goal_repository.dart';
import 'domain/repositories/task_respository.dart';

import 'presentation/providers/goal_providert.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TaskRepositoryInterface>(
          create: (_) => TaskRepositoryImpl(),
        ),
        Provider<GoalRepositoryInterface>(
          create: (_) => GoalRepositoryImpl(),
        ),
        ChangeNotifierProvider<GoalProvider>(
          create: (ctx) => GoalProvider(
            ctx.read<GoalRepositoryInterface>(),
          )..loadGoals(),
        ),
        ChangeNotifierProvider<TaskProvider>(
          create: (ctx) => TaskProvider(
            ctx.read<TaskRepositoryInterface>(),
          )..loadTasks(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daily Goals',
        theme: darkTheme,
        initialRoute: AppRoutes.home,
        routes: {
          AppRoutes.home: (_) => HomeScreen(),
          AppRoutes.createTask: (_) => FormScreen(),
          AppRoutes.detailsTask: (_) => DetailsTaskScreen(),
        },
      ),
    );
  }
}
