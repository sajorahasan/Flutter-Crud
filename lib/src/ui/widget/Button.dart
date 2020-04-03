import 'package:flutter/material.dart';
import 'package:flutterdatabase/res/app_colors.dart';
import 'package:flutterdatabase/res/app_styles.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class Button {
  static Widget getRaisedButton(String label, Function func) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      onPressed: func,
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
      color: AppColors.accentColor,
      child: Text(label,
          style:
              TextStyle(color: Colors.white, fontFamily: AppStyles.FONT_BOLD)),
    );
  }

  static FloatingActionButton getFloatingButton(
      {IconData icon = OMIcons.add, VoidCallback onPressed}) {
    return FloatingActionButton(
        backgroundColor: AppColors.accentColor,
        child: Icon(icon, color: Colors.white),
        onPressed: onPressed);
  }
}
