import 'package:flutter/material.dart';

class AppColors {
  const AppColors();

  static const Color backgroundColor = const Color(0xffFFFFFF);
  static const Color primaryColor = const Color(0xff105090);
  static const Color primaryColorDark = const Color(0xff10436d);
  static const Color primaryColorLight = const Color(0x78105090);
  static const Color secondaryColor = const Color(0xff00a79c);
  static const Color secondaryColorDark = const Color(0xff028577);
  static Color accentColor = Colors.teal[500];

  static Color APPBAR_MENU_ICON_COLOR = Colors.grey[800];
  static Color APPBAR_MENU_SUBMIT_ICON_COLOR = primaryColor;

  static Color parseHexColor(String hexColor) {
    var color = int.parse(hexColor.replaceFirst("#", ""), radix: 16);
    return Color(color).withOpacity(1.0);
  }
}
