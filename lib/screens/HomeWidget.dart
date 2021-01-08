import 'package:flutter/material.dart';
import 'package:flutter_cuber_timer/screens/TimerWidget.dart';
import 'package:flutter_cuber_timer/screens/GraphicsWidget.dart';
import 'package:flutter_cuber_timer/screens/ResultsListWidget.dart';
import 'package:flutter_cuber_timer/views/BottomBarItem.dart';

class NavObject {
  Widget screen;
  NavObject({this.screen});
}

List<NavObject> navItems = [
  NavObject(
    screen: TimerWidget(title: "Timer"),
  ),
  NavObject(
    screen: ResultsListWidget(title: "Result"),
  ),
  NavObject(
    screen: GraphicsWidget(title: "Graphics"),
  )
];

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _screenNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navItems[_screenNumber].screen,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: BottomBarItem(
                  iconResource: 'assets/images/settings.png'
              ),
              title: Text('Settings')
          ),
          BottomNavigationBarItem(
              icon: BottomBarItem(
                  iconResource: 'assets/images/friends.png'
              ),
              title: Text('Friends')
          ),
          BottomNavigationBarItem(
              icon: BottomBarItem(
                  iconResource: 'assets/images/chats.png'
              ),
              title: Text('Chats')
          ),
        ],

        currentIndex: _screenNumber,
        onTap: (i) => setState(() {
          _screenNumber = i;
        }),
      ),

    );
  }
}
