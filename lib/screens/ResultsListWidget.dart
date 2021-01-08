import 'package:flutter/material.dart';
import 'package:flutter_cuber_timer/views/ItemHistory.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_cuber_timer/models/HistoryModel.dart';

class ResultsListWidget extends StatefulWidget {
  ResultsListWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ResultsListWidget createState() => _ResultsListWidget();
}

class _ResultsListWidget extends State<ResultsListWidget> {

  List<HistoryItem> itemsIn = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    var pref = await SharedPreferences.getInstance();
    var results = pref.getStringList("results");
    print(results);

    setState(() {
      itemsIn = results.map((e) => getHolder(e)).toList();

      print("end state");
    });
  }

  HistoryItem getHolder(String e) {
    print("start getHolder");
    var item = HistoryModel.fromString(e);
    print("end getHolder");
    var tmp = HistoryItem();
    tmp.set(item.date, item.result, item.cubeVariant);
    return tmp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: itemsIn.length,
          itemBuilder: (context, index) {
            final item = itemsIn[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        )
    );
  }
}
