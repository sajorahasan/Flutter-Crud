import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class EmptyView extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final double iconSize;

  EmptyView(
      {this.icon = OMIcons.viewList,
      this.iconSize = 96,
      this.title,
      this.subTitle = ''});

  @override
  Widget build(BuildContext context) {
    return getView(context);
  }

  Widget getView(BuildContext context) {
    String emptyViewTitle = title;
    if (title == null) {
      emptyViewTitle = "No Records found.";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Icon(
          icon,
          size: iconSize,
          color: Colors.grey[500],
        ),
        new ListTile(
          title: Center(child: Text(emptyViewTitle)),
          subtitle: Center(
              child: Text(
            subTitle,
            textAlign: TextAlign.center,
          )),
        )
      ],
    );
  }
}
