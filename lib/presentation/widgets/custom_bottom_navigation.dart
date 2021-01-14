import 'package:daily_goals/presentation/routes/app_routes.dart';
import 'package:daily_goals/presentation/theme.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: 2,
      iconSize: 25,
      unselectedIconTheme: IconThemeData(
        color: AppColors.secondaryTextColor,
        size: 28,
      ),
      items: [
        BottomNavigationBarItem(
          title: Container(),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Container(),
          icon: Icon(Icons.graphic_eq),
        ),
        BottomNavigationBarItem(
          title: Container(),
          icon: InkWell(
            onTap: () => Navigator.pushNamed(context, AppRoutes.form),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
        BottomNavigationBarItem(
          title: Container(),
          icon: Icon(Icons.alarm),
        ),
        BottomNavigationBarItem(
          title: Container(),
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
