import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme{
  static ThemeData darkTheme=   ThemeData(
  primaryColor: AppColor.coffee,
  primaryColorDark: AppColor.black,
  primaryColorLight: AppColor.white,
  scaffoldBackgroundColor: Colors.black,


  appBarTheme: AppBarTheme(
  backgroundColor: Colors.transparent,
  centerTitle: true,
  titleTextStyle: TextStyle(
  fontSize: 26,
  color: AppColor.white,


  ),
  iconTheme: IconThemeData(
  color: AppColor.coffee,
  )
  ),
  textTheme: TextTheme(
  bodyLarge:  TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 24,
  color: Colors.white
  ),
  bodySmall:  TextStyle(
  fontSize: 16,
  color: Colors.white
  ),
  bodyMedium:  TextStyle(
  fontSize: 20,
  color: Colors.white
  ),
  )
  );
}