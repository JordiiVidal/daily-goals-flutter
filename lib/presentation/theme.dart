import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static final primaryColor = Color(0XFF042d55);
  static final secondaryColor = Color(0XFF3450a1);
  static final accentColor = Color(0XFFeb06ff);
  static final secondaryAccentColor = Color(0XFF2dff06);
  static final primaryTextColor = Color(0XFFFFFFFF);
  static final secondaryTextColor = Color(0XFF8facf3);
  static final accentTextColor = Color(0XFFa33751);
}

final darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.secondaryColor,
  primaryColor: AppColors.primaryColor,
  buttonColor: AppColors.primaryColor,
  textTheme: GoogleFonts.robotoTextTheme().apply(
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
  ),
);
