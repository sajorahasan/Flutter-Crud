import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdatabase/res/app_drawables.dart';
import 'package:flutterdatabase/src/ui/main/dashboard_screen.dart';
import 'package:flutterdatabase/src/utils/intent_utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _goToNextScreen() {
    IntentUtil.switchPage(context, DashboardScreen(), clearStack: true);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      _goToNextScreen();
    });

    return Scaffold(
      body: Center(
        child: Image.asset(AppDrawable.APP_LOGO),
      ),
    );
  }
}
