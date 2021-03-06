import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme();

  static ThemeData themeData = ThemeData(
      backgroundColor: CustomColor.background,
      primaryColor: CustomColor.purple,
      cardTheme: CardTheme(color: CustomColor.background),
      textTheme: TextTheme(headline4: TextStyle(color: CustomColor.black)),
      iconTheme: IconThemeData(color: CustomColor.iconColor),
      bottomAppBarColor: CustomColor.background,
      dividerColor: CustomColor.grey,
      primaryTextTheme:
          TextTheme(bodyText2: TextStyle(color: CustomColor.titleTextColor)));
}

class CustomColor {
  static const Color background = Color(0XFFfefefe);

  static const Color titleTextColor = Color(0xff1b1718);
  static const Color subTitleTextColor = Color(0xffb9bfcd);
  static const Color indigo = Colors.indigo;

  static const Color skyBlue = Color(0xff71b4fb);
  static const Color lightBlue = Color(0xff7fbcfb);
  static const Color extraLightBlue = Color(0xffd9eeff);

  static const Color orange = Color(0xfffa8c73);
  static const Color lightOrange = Color(0xfffa9881);

  static const Color purple = Color(0xff8873f4);
  static const Color purpleLight = Color(0xff9489f4);
  static const Color purpleExtraLight = Color(0xffb1a5f6);
  static const Color accentBlue = Colors.blueAccent;
  static const Color grey = Color(0xffb8bfce);

  static const Color iconColor = Color(0xff000000);
  static const Color green = Color(0xff4cd1bc);
  static const Color lightGreen = Color(0xff5ed6c3);

  static const Color black = Color(0xff20262C);
  static const Color lightblack = Color(0xff5F5F60);
}
