import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static final white = Color(0XFFffffff);
  static final lightGrey = Color(0XFFfbfbfb);
  static final black = Color(0XFF2a2a2a);
  static final primaryColor = Color(0xff4b6bf1);
  static final secondaryColor = Color(0xffdbe2f9);
}

class AppShadows {
  static final firstShadow = BoxShadow(
    blurRadius: 20,
    color: Colors.grey[200],
    offset: Offset(0, -2),
  );
  static final lastShadow = BoxShadow(
    blurRadius: 20,
    color: Colors.grey[200],
    offset: Offset(0, 20),
  );
}

final lightTheme = ThemeData(
  textTheme: GoogleFonts.robotoTextTheme().apply(
    bodyColor: AppColors.black,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.black,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryColor,
  ),
);
