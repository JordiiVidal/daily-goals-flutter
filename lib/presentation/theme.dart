import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static final white = Color(0XFF000000);
  static final lightGrey = Color(0XFFfbfbfb);
  static final black = Color(0XFF2a2a2a);
}

final lightTheme = ThemeData(
  textTheme: GoogleFonts.robotoTextTheme().apply(
    bodyColor: AppColors.black,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.black,
  ),
);
