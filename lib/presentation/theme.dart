import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static final primaryColor = const Color(0XFF292e3c);
  static final secondaryColor = const Color(0XFF1d1f25);
  static final accentColor = const Color(0XFFeb06ff);
  static final secondaryAccentColor = const Color(0XFF2dff06);
  static final primaryTextColor = const Color(0XFFFFFFFF);
  static final secondaryTextColor = const Color(0XFF8facf3);
  static final accentTextColor = const Color(0XFFa33751);
}

class AppPadding {
  static final screen = const EdgeInsets.symmetric(horizontal: 12.0);
  static final title = const EdgeInsets.symmetric(vertical: 12.0);
  static final form = const EdgeInsets.only(left: 25, right: 25, bottom: 20);
  static final formH = const EdgeInsets.only(left: 25, right: 25);
  static final formV = const EdgeInsets.only(top: 20, bottom: 20);
}

final darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.secondaryColor,
  primaryColor: AppColors.primaryColor,
  buttonColor: AppColors.primaryColor,
  textTheme: GoogleFonts.montserratTextTheme().apply(
    bodyColor: AppColors.primaryTextColor,
  ),
  backgroundColor: AppColors.secondaryColor,
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.accentColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: AppColors.secondaryTextColor,
    ),
  ),
  iconTheme: IconThemeData(
    color: AppColors.secondaryTextColor,
  ),
  appBarTheme: AppBarTheme(
    color: AppColors.secondaryColor,
    elevation: 0.0,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.accentColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: AppColors.primaryColor,
  ),
);
