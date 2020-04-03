import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdatabase/res/app_styles.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  static void setLightStatusBar() {
    //Set StatusBar color as white
    //Set StatusBar icon color as dark grey
    //Set NavigationBar color as white
    //Set NavigationBar icon color as dark grey
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.grey[200],
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));
  }

  static void showToast(String message,
      {Toast toastLength = Toast.LENGTH_SHORT, int toastType = 0}) {
    if (toastType == 0) {
      Fluttertoast.showToast(
          msg: message,
          toastLength: toastLength,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    } else if (toastType == 1) {
      Fluttertoast.showToast(
          msg: message,
          toastLength: toastLength,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: message,
          toastLength: toastLength,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  static void showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: Row(
      children: <Widget>[
        Icon(Icons.check),
        SizedBox(width: 10),
        Flexible(child: Text(message)),
      ],
    )));
  }

  static void showSnackBarBottom(String message,
      {BuildContext context, GlobalKey<ScaffoldState> scaffoldKey}) {
    ScaffoldState scaffoldState;
    if (scaffoldKey != null) {
      scaffoldState = scaffoldKey.currentState;
    } else {
      scaffoldState = Scaffold.of(context);
    }

    scaffoldState.showSnackBar(new SnackBar(
      backgroundColor: Colors.grey[800],
      content: Row(
        children: <Widget>[
          Flexible(
              child: Text(
            message,
            style: TextStyle(
                fontSize: 14,
                fontFamily: AppStyles.FONT_MEDIUM,
                color: Colors.white),
          ))
        ],
      ),
    ));
  }
}
