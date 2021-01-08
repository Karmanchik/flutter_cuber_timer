import 'package:flutter/material.dart';

class CubeTypesListWidget extends StatefulWidget {
  CubeTypesListWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CubeTypesListWidget createState() => _CubeTypesListWidget();
}

class _CubeTypesListWidget extends State<CubeTypesListWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
