import 'package:flutter/material.dart';
import 'package:sportcred/models/global.dart';
import 'package:sportcred/UI/ACS/HistoryWidget.dart';

class ACSHistory extends StatelessWidget {
  final List<String> history;

  ACSHistory({this.history});

  @override
  Widget build(BuildContext context){
    List<String> getActivity(history) {
      List<String> activity = history.toString().split(" ");
      return activity;
    }

    return Scaffold(
      backgroundColor: AppTheme.backgroundGray,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ACS History',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: 'Lato',
              fontSize: 20
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: history.length,
                  padding: EdgeInsets.all(10.0),
                  itemBuilder: (BuildContext context, int index) {
                    List<String> parts = getActivity(history.elementAt(index));
                    return HistoryWidget(
                        activity: parts.elementAt(0),
                        change: parts.elementAt(1)
                    );
                  }
                )
            )
          ]
        )
      )
    );
  }
}
