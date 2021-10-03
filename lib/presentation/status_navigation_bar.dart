import 'package:daily_goals/presentation/theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void changeColors({Color statusBar, Color navigationBar}) {
  statusBar = statusBar ?? AppColors.secondaryColor;
  navigationBar = navigationBar ?? AppColors.secondaryColor;
  Future.delayed(
    Duration(milliseconds:  225),
    () => SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: statusBar,
        systemNavigationBarColor: navigationBar,
      ),
    ),
  );
}
