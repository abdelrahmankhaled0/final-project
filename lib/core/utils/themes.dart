import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backGroundColor,
    fontFamily: AppFonts.dmSerifDisplay,
    appBarTheme: AppBarThemeData(
      backgroundColor: AppColors.backGroundColor,
      elevation: 0.0,
    ),
  );
}
