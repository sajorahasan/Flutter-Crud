import 'package:flutter/material.dart';
import 'package:flutterdatabase/res/app_styles.dart';

class DialogUtils {
  static void showProgressDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                width: 16,
              ),
              Text("Please wait...")
            ],
          )
              //Text("Are you serious right there?"),
              );
        });
  }

  static void showErrorDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Error",
              style: AppStyles.DIALOG_TITLE_TEXT_STYLE,
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child:
                    Text("DISMISS", style: AppStyles.DIALOG_BUTTON_TEXT_STYLE),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  static void showDeleteConfirmationDialog(
      BuildContext context, String message, VoidCallback onClick,
      {String title = "Delete"}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              title,
              style: AppStyles.DIALOG_TITLE_TEXT_STYLE,
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text("NO", style: AppStyles.DIALOG_BUTTON_TEXT_STYLE),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("YES", style: AppStyles.DIALOG_BUTTON_TEXT_STYLE),
                onPressed: () {
                  Navigator.of(context).pop();
                  onClick();
                },
              )
            ],
          );
        });
  }

  static void showAlertMessage(
      BuildContext context, String title, String message,
      {VoidCallback info}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              title,
              style: AppStyles.DIALOG_TITLE_TEXT_STYLE,
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child:
                    Text("DISMISS", style: AppStyles.DIALOG_BUTTON_TEXT_STYLE),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("INFO", style: AppStyles.DIALOG_BUTTON_TEXT_STYLE),
                onPressed: () {
                  Navigator.of(context).pop();
                  info();
                },
              )
            ],
          );
        });
  }
}
