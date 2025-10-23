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
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
    ),
    inputDecorationTheme: InputDecorationThemeData(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 1, color: AppColors.grayColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 8, color: AppColors.borderColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.backGroundColor,
        minimumSize: Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
  );
}
