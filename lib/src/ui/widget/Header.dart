import 'package:flutter/material.dart';
import 'package:flutterdatabase/res/app_styles.dart';

class Header {
  static AppBar getAppBar(BuildContext context, String title,
      {Key key,
      Widget bottom,
      List<Widget> actions,
      double elevation = 0,
      bool showBack = false}) {
    Widget backButton;

    if (showBack) {
      backButton = BackButton(color: Colors.black);
    }

    AppBar appBar = AppBar(
        key: key,
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: actions,
        elevation: elevation,
        brightness: Brightness.light,
        bottom: bottom,
        leading: backButton,
        title: Text(
          title,
          style: AppStyles.TOOLBAR_TITLE_TEXT_STYLE,
        ));

    return appBar;
  }
}
