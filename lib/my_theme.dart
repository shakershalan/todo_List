import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = Color(0xff5D9CEC);
  static Color backgroundLight = Color(0xffDFECDB);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color greyColor = Color(0xff7f8792);
  static Color blackColor = Color(0xff383838);
  static Color redColor = Color(0xffEC4B4B);

  static ThemeData themeLight = ThemeData(
    scaffoldBackgroundColor: backgroundLight,
    appBarTheme: AppBarTheme(elevation: 0, backgroundColor: primaryLight),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryLight,
      unselectedItemColor: greyColor,
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryLight,
        shape: StadiumBorder(side: BorderSide(width: 3, color: whiteColor))),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor),
      titleMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: blackColor),
      titleSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: blackColor),
    ),
  );
}
