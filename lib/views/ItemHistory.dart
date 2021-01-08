import 'package:flutter/material.dart';

// abstract class HistoryItem {
//   Widget buildTitle(BuildContext context);
//   Widget buildSubtitle(BuildContext context);
//
//
// }

class HistoryItem {

  set(String dateParam, String resultParam, String cubeParam) {
    date = dateParam;
    result = resultParam;
    cubeVariant = cubeParam;
  }

  String date;
  String result;
  String cubeVariant;


  Widget buildTitle(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.all(1.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(15.0))
        ),
        child: Row(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // new Expanded(
                  //     child:
                      Text(date,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      // )
                  ),
                  Text(result,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(cubeVariant,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14
                    ),
                  ),
                  FlatButton(
                    onPressed: () {

                    },
                    child: Text("Del"),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }

  Widget buildSubtitle(BuildContext context) => null;
}