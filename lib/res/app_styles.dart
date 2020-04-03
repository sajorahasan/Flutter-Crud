import 'package:flutter/material.dart';
import 'package:flutterdatabase/res/app_colors.dart';

class AppStyles {
  const AppStyles();

  static const String FONT_BOLD = 'GoogleSansBold';
  static const String FONT_MEDIUM = 'GoogleSansMedium';
  static const String FONT_REGULAR = 'GoogleSansRegular';

  static const TextStyle APP_TITLE =
      const TextStyle(fontSize: 25.0, color: Colors.white);

  static const TextStyle TAB_TEXT_STYLE =
      const TextStyle(fontFamily: 'GoogleSansBold');

  static TextStyle TOOLBAR_TITLE_TEXT_STYLE =
      TextStyle(fontSize: 20, color: Colors.grey[900], fontFamily: FONT_BOLD);

  static TextStyle DIALOG_TITLE_TEXT_STYLE =
      TextStyle(fontFamily: FONT_MEDIUM, fontSize: 20, color: Colors.black);

  static TextStyle DIALOG_CONTENT_TEXT_STYLE = TextStyle(
      fontFamily: FONT_REGULAR, fontSize: 16, color: Colors.grey[700]);

  static TextStyle DIALOG_BUTTON_TEXT_STYLE = TextStyle(
      fontFamily: FONT_REGULAR, fontSize: 16, color: AppColors.accentColor);
}
