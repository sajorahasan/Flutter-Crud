import 'package:flutter/material.dart';
import 'package:flutterdatabase/res/app_colors.dart';
import 'package:flutterdatabase/res/app_styles.dart';
import 'package:flutterdatabase/src/ui/main/splash_screen.dart';

class DemoApp extends StatelessWidget {
  static var APP_GLOBAL_KEY = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: APP_GLOBAL_KEY,
      title: "Flutter SQFLite Demo App",
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: AppColors.primaryColor,
          primaryColorDark: AppColors.primaryColorDark,
          accentColor: AppColors.accentColor,
          scaffoldBackgroundColor: AppColors.backgroundColor,
          dividerColor: Colors.white,
          //splashColor: The color of ink splashes. See InkWell.
          splashColor: AppColors.primaryColorLight,
          //cursorColor: The color of cursors in Material-style text fields, such as TextField.
          cursorColor: Colors.grey[700],
          //indicatorColor: The color of the selected tab indicator in a tab bar.
          indicatorColor: AppColors.accentColor,

          // A theme for customizing the size, sha// pe, and color of the tab bar indicator.
          tabBarTheme: TabBarTheme(
            labelColor: AppColors.accentColor,
            unselectedLabelColor: Colors.grey[800],
            labelStyle: AppStyles.TAB_TEXT_STYLE,
            unselectedLabelStyle: AppStyles.TAB_TEXT_STYLE,
          ),

          //Text with a color that contrasts with the card and canvas colors.
          textTheme: TextTheme(
            title: AppStyles.TOOLBAR_TITLE_TEXT_STYLE,
          ),

          //A theme for customizing the shape, elevation, and color of a FloatingActionButton.
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: AppColors.primaryColor,
          ),

          //The default color of the BottomAppBar.
          bottomAppBarColor: Colors.white,
          bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
          fontFamily: AppStyles.FONT_REGULAR,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
          ),
          dialogTheme: DialogTheme(
              titleTextStyle: AppStyles.DIALOG_TITLE_TEXT_STYLE,
              contentTextStyle: AppStyles.DIALOG_CONTENT_TEXT_STYLE)),
      home: SplashScreen(),
    );
  }
}
