import 'package:flutter/material.dart';

class BottomBarItem extends StatefulWidget {
  BottomBarItem({this.iconResource});

  final String iconResource;

  _BottomBarItem createState() => new _BottomBarItem(iconResource: iconResource);
}

class _BottomBarItem extends State<BottomBarItem> {

  _BottomBarItem({this.iconResource});

  final String iconResource;

  @override
  Widget build(BuildContext context) {
    return new Stack(
        children: <Widget>[
          new Image.asset(iconResource, width: 30, height: 30)
        ]
    );
  }
}