import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'data/repositories/task_repositorty_impl.dart';
import 'data/repositories/goal_repository_impl.dart';

import 'domain/repositories/goal_repository.dart';
import 'domain/repositories/task_respository.dart';

import 'presentation/providers/main_providert.dart';
import 'presentation/routes/app_routes.dart';
import 'presentation/screens/task_form_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.secondaryColor,
      systemNavigationBarColor: AppColors.secondaryColor,
    ),
  );
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
        ChangeNotifierProvider<MainProvider>(
          create: (ctx) => MainProvider(
            ctx.read<GoalRepositoryInterface>(),
            ctx.read<TaskRepositoryInterface>(),
          )..initData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daily Goals',
        theme: darkTheme,
        initialRoute: AppRoutes.home,
        routes: {
          AppRoutes.home: (_) => HomeScreen(),
          AppRoutes.taskForm: (_) => TaskFormScreen(),
        },
      ),
    );
  }
}
