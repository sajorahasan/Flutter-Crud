import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdatabase/res/app_colors.dart';
import 'package:flutterdatabase/src/data/local/entity/user.dart';
import 'package:flutterdatabase/src/ui/main/dashboard_screen.dart';

class UserCard extends StatelessWidget {
  final User user;

  UserCard(this.user);

  Widget getUserCard() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(user.name,
              style: TextStyle(fontFamily: 'GoogleSansMedium', fontSize: 16)),
          Text(user.email, style: TextStyle(fontSize: 15))
        ],
      ),
    );
  }

  Widget getColorStrip() {
    return Container(
      width: 6,
      height: 64,
      color: AppColors.accentColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(vertical: 6),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            DashboardScreen.goToNextScreen(context, user: user);
          },
          splashColor: Colors.grey[200],
          child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
            getColorStrip(),
            SizedBox(width: 8),
            getUserCard()
          ]),
        ));
  }
}
