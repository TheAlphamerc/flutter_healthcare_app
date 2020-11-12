import 'package:flutter/material.dart';

import 'light_color.dart';


class AppTheme {
  const AppTheme();
  static ThemeData lightTheme = ThemeData(
    backgroundColor: ColorResources.background,
    primaryColor: ColorResources.themered,
    cardTheme: CardTheme(color: ColorResources.background),
    textTheme: TextTheme(display1: TextStyle(color: ColorResources.black)),
    iconTheme: IconThemeData(color: ColorResources.iconColor),
    bottomAppBarColor: ColorResources.background,
    dividerColor: ColorResources.grey,
    primaryTextTheme: TextTheme(
      body1: TextStyle(color:ColorResources.titleTextColor)
    )
  );

  static TextStyle titleStyle = const TextStyle(color: ColorResources.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle = const TextStyle(color: ColorResources.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);

  static List<BoxShadow> shadow =  <BoxShadow>[
    BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];
  
  
  static EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(horizontal: 10,);

  static double fullWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  static double fullHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
}