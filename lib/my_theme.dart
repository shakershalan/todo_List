import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = Color(0xff5D9CEC);
  static Color backgroundLight = Color(0xffDFECDB);
  static Color primaryColor = Color(0xff5D9CEC);
  static Color greenColor = Color(0xff5D9CEC);
  static Color blackColor = Color(0xff5D9CEC);
}

ThemeData themeData = ThemeData(
    appBarTheme:
        AppBarTheme(elevation: 0, backgroundColor: MyTheme.primaryLight));
