import 'package:commitm_task/common/utils/my_colors.dart';
import 'package:flutter/material.dart';

class MyThemes {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: MyColors.primaryColor,
      onPrimary: Colors.green,
      secondary: MyColors.secondColor,
      onSecondary: Colors.green,
      error: MyColors.errorColor,
      onError: Colors.green,
      background: MyColors.primaryColor,
      onBackground: Colors.green,
      surface: Colors.green,
      onSurface: Colors.green,
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: MyColors.primaryColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: MyColors.blackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: MyColors.primaryColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: MyColors.blackColor,
      ),
      bodySmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: MyColors.deactivateColor,
      ),
    ),
  );

  static final darkTheme = ThemeData();
}
