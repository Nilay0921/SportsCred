import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  final String activity;
  String change;

  HistoryWidget({this.activity, this.change});

  @override
  Widget build(BuildContext context) {
    bool increase = true;
    IconData arrow = Icons.arrow_upward;
    if (double.parse(change) < 0) {
      increase = false;
      arrow = Icons.arrow_downward;
      change = (double.parse(change).abs()).toString();
    }
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            title: Text(
                activity.split(" ")[0],
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                )
            ),
            trailing: Wrap(
                children: <Widget>[
                  Icon(arrow, color: increase ? Colors.green : Colors.red),
                  Text(
                      '$change points',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                      )
                  )
                ]
            )
        )
    );
  }
}

