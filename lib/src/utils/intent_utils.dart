import 'package:flutter/material.dart';

class IntentUtil {
  static void goBack(BuildContext context) {
    if (Navigator.canPop(context)) Navigator.pop(context);
  }

  static void switchPage(BuildContext context, Widget page,
      {bool clearStack = false}) async {
    var route = MaterialPageRoute(builder: (__) => page);
    if (clearStack) {
      Navigator.pushReplacement(context, route);
    } else {
      Navigator.push(context, route);
    }
  }

  static Future<T> startPageForResult<T extends Object>(
      BuildContext context, Widget page) async {
    var route = MaterialPageRoute<T>(builder: (__) => page);
    return Navigator.push(context, route);
  }
}
