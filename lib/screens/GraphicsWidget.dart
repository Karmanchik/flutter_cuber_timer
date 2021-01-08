import 'package:flutter/material.dart';

class GraphicsWidget extends StatefulWidget {
  GraphicsWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GraphicsWidget createState() => _GraphicsWidget();
}

class _GraphicsWidget extends State<GraphicsWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
