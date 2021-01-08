import 'package:flutter/material.dart';
import 'package:flutter_cuber_timer/models/HistoryModel.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class TimerWidget extends StatefulWidget {
  TimerWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TimerWidget createState() => _TimerWidget();
}

class _TimerWidget extends State<TimerWidget> {

  static const duration = const Duration(milliseconds: 50);
  SharedPreferences prefs;
  bool isActive = false;
  bool isWork = false;
  Timer timer;
  var time = 0;

  void handleTick() {
    if (isActive) {
      setState(() {
        time += 50;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (timer == null)
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    initParams();
  }

  Future<void> initParams() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {

    String minutes = (time ~/ (1000 * 60)).toString();
    String seconds = (time ~/ 1000).toString().padLeft(2, '0');
    String milliseconds = (time % 1000).toString().padLeft(3, '0');

    return Scaffold(
      body: GestureDetector(
        onTapDown: (details) {
          setState(() {
            if (isWork) {
              isActive = false;
              var history = prefs.getStringList("results") ?? [];

              DateTime now = DateTime.now();
              DateFormat formatter = DateFormat('yyyy-MM-dd');

              HistoryModel item = HistoryModel(formatter.format(now), '$minutes:$seconds:$milliseconds', '3x3');
              history.add(item.toString());
              print(prefs.setStringList("results", history));
            } else {
            }
          });
        },
        onTapUp: (details) {
          setState(() {
            if (isWork) {
              isWork = false;
            } else {
              isActive = true;
              isWork = true;
              time = 0;
            }
          });
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('$minutes:$seconds:$milliseconds', style: TextStyle(fontSize: 48),)
            ],
          ),
        ),
      ),
    );
  }

}
