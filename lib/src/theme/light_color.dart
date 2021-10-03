import 'package:flutter/material.dart';

class ColorResources {
  static const Color background = Color(0XFFfefefe);

  static const Color titleTextColor = const Color(0xff1b1718);
  static const Color subTitleTextColor = const Color(0xffb9bfcd);

  static const Color skyBlue = Color(0xff71b4fb);
  static const Color lightBlue = Color(0xff7fbcfb);
  static const Color extraLightBlue = Color(0xffd9eeff);

  static const Color orange = Color(0xfffa8c73);
  static const Color lightOrange = Color(0xfffa9881);

  static const Color purple = Color(0xff8873f4);
  static const Color purpleLight = Color(0xff9489f4);
  static const Color purpleExtraLight = Color(0xffb1a5f6);

  static const Color grey = Color(0xffb8bfce);

  static const Color iconColor = Color(0xffcbd0db);
  static const Color green = Color(0xff4cd1bc);
  static const Color lightGreen = Color(0xff5ed6c3);

  static const Color black = Color(0xff20262C);
  static const Color lightblack = Color(0xff5F5F60);
  // static const Color themered = Color(0xffff5A79);
  static const Color themered = Color(0xff8BC73C);

  static const Color white = Color(0xffffffff);

  static const Map<int, Color> colorMap = {
    50: Color(0x10FFFFFF),
    100: Color(0x20FFFFFF),
    200: Color(0x30FFFFFF),
    300: Color(0x40FFFFFF),
    400: Color(0x50FFFFFF),
    500: Color(0x60FFFFFF),
    600: Color(0x70FFFFFF),
    700: Color(0x80FFFFFF),
    800: Color(0x90FFFFFF),
    900: Color(0xffFFFFFF),
  };

  static const MaterialColor MATERIAL_WHITE =
      MaterialColor(0xffFFFFFF, colorMap);
//FF5A79
}
